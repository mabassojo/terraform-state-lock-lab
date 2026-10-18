# Terraform State Locking Lab

This repository contains the hands-on labs accompanying my Medium article:

**Terraform State Locking Explained: Reproducing Lock Failures and Recovering Safely**

📖 **Read the article on Medium:**  
[Terraform State Locking Explained: Reproducing Lock Failures and Recovering Safely](YOUR-MEDIUM-ARTICLE-URL)

## Overview

This lab demonstrates several common Terraform state-locking scenarios and how to troubleshoot them safely.

The exercises cover:

- Local Terraform state contention
- S3 remote state locking using `use_lockfile = true`
- Two Terraform runners competing for the same remote state
- Simulating and recovering from a stale Terraform lock
- Two unrelated Terraform projects accidentally sharing the same state
- Understanding when `terraform force-unlock` is appropriate

## Lab Structure

```text
terraform-state-lock-lab/
│
├── 01-local-contention/
│   └── main.tf
│
├── bootstrap/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── 02-s3-contention/
│   ├── runner-a/
│   │   ├── backend.tf
│   │   └── main.tf
│   └── runner-b/
│       ├── backend.tf
│       └── main.tf
│
├── 03-stale-lock/
│   ├── backend.tf
│   └── main.tf
│
└── 04-shared-state/
    ├── application-a/
    │   ├── backend.tf
    │   └── main.tf
    └── application-b/
        ├── backend.tf
        └── main.tf
```

## Prerequisites

Before starting, you will need:

- Terraform 1.10+
- AWS CLI
- An AWS sandbox or non-production account
- AWS credentials configured locally
- Git
- Multiple terminal sessions

Verify your setup:

```bash
terraform version
aws sts get-caller-identity
```

## Labs

### 01 — Local State Contention

Run two Terraform operations against the same local state and observe how Terraform prevents concurrent state modification.

### 02 — S3 State Contention

Configure an S3 backend with:

```hcl
use_lockfile = true
```

Then run Terraform from two separate runners against the same S3 state and observe the remote locking behavior.

### 03 — Stale State Lock

Simulate an interrupted Terraform process, inspect the remaining lock, and recover it safely using:

```bash
terraform force-unlock <LOCK_ID>
```

Only use `force-unlock` after verifying that no legitimate Terraform process still owns the lock.

### 04 — Accidentally Shared State

Configure two unrelated Terraform projects to use the same S3 backend
