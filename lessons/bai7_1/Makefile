-include .env

.PHONY: deploy-arb-sep

deploy-arb-sep:
	forge script script/DeployToken.s.sol:DeployToken --rpc-url $(ARB_SEP) --account sepolia_testing --broadcast --verify --verifier-url "https://api.etherscan.io/v2/api?chainid=421614" --etherscan-api-key $(ETHERSCAN_API_KEY)
