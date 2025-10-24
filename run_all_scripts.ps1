# File: run_all_scripts.ps1
# Description: Automates PostgreSQL execution for Titanic dataset

# --- Configuration ---
$psqlPath = "C:\Program Files\PostgreSQL\17\bin\psql.exe"   # Adjust if your PostgreSQL version/folder differs
$dbName = "titanic_db"
$userName = "postgres"
$scriptFolder = "C:\Users\nayak\OneDrive\Desktop\PowerBI\RepoFolder"

# --- Script Execution ---
Write-Host "Starting PostgreSQL automation for Titanic project..." -ForegroundColor Cyan

# 1. Create Table
Write-Host "Step 1: Creating tables..."
& "$psqlPath" -U $userName -d $dbName -f "$scriptFolder\SQLQuery_CreateTable.sql"

# 2. Import Data
Write-Host "Step 2: Importing data..."
& "$psqlPath" -U $userName -d $dbName -f "$scriptFolder\SQLQuery_ImportDataInToTable.sql"

# 3. Clean Data
Write-Host "Step 3: Cleaning data..."
& "$psqlPath" -U $userName -d $dbName -f "$scriptFolder\SQLQuery_ToCleanData.sql"

Write-Host "✅ All steps completed successfully!" -ForegroundColor Green
