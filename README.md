# AWS S3 Bucket Website Hosting

This project sets up an AWS S3 bucket to host a static website, including HTML pages and images. It configures the S3 bucket and its objects using Terraform, ensuring proper access controls, ownership, and public access settings.

## Overview

The Terraform configuration includes:

- **S3 Bucket Creation**: A bucket is created with a name specified by the `var.bucket_name` variable.
- **Ownership Controls**: Sets the object ownership to `BucketOwnerPreferred` to ensure the bucket owner has full control over the objects.
- **Public Access Block Settings**: Configures the bucket to allow public access by setting various public access block options to `false`.
- **Access Control List (ACL)**: Applies a `public-read` ACL to the bucket, making it accessible over the web.
- **Static Files**: Uploads HTML pages (`index.html` and `error.html`) and images (`diwali.jpg`, `ganesh.jpg`, `holi.jpg`, `raksha.jpg`) to the bucket.
- **Website Configuration**: Configures the bucket for website hosting with `index.html` as the index document and `error.html` as the error document.

## Prerequisites

- AWS Account
- Terraform installed
- AWS CLI configured

## Usage

1. **Initialize Terraform**:

   ```bash
   terraform init