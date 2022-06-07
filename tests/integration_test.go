package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"

	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)

func TestApplySingleRegion(t *testing.T) {
	// Not running in parallel due to a current naming limitation for the public IP causing a conflict
	//t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "SingleRegion" // Underscores are not allowed in TM names
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	serviceLocation := "UK South"
	resourceLocations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment": serviceDeployment,
			"service_location":   serviceLocation,
			"resource_locations": resourceLocations,
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.DestroyE(t, terraformOptions)

	// At the end of the test, run `terraform destroy` again, in case failures leave orphaned resources
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)
}

func TestApplyMultiRegion(t *testing.T) {
	// Not running in parallel due to a current naming limitation for the public IP causing a conflict
	//t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "MultiRegion" // Underscores are not allowed in TM names
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	serviceLocation := "UK South"
	resourceLocations := []string{"UK South", "North Central US"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment": serviceDeployment,
			"service_location":   serviceLocation,
			"resource_locations": resourceLocations,
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.DestroyE(t, terraformOptions)

	// At the end of the test, run `terraform destroy` again, in case failures leave orphaned resources
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)
}
