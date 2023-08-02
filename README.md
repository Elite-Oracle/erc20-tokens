# ERC20 Token Creator

# Usage

## OpenZeppelin

[OpenZeppelin Contracts Docs](https://docs.openzeppelin.com/contracts/4.x/)
<br><br>
[OpenZeppelin GitHub Repo](https://github.com/OpenZeppelin/openzeppelin-contracts)
<br>

### Installing OpenZeppelin Contracts Package

```bash
forge install OpenZeppelin/openzeppelin-contracts --no-commit
```

## Start a local node

```
make anvil
```

## Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

```
make deploy
```

## Deploy - Other Network

[See below](#deployment-to-a-testnet-or-mainnet)

## Testing 

1. Unit
2. Integration
3. Forked
4. Staging

```
forge test
```

or 

```
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage

```
forge coverage
```


# Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

1. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

2. Deploy

```
make deploy ARGS="--network sepolia"
```


## Scripts

After deploy to a testnet or local net, you can run the scripts. 

Using cast deployed locally example: 

```
cast send <ERC20_CONTRACT_ADDRESS> "transfer()"  --value 0.1ether --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
```

or, to create a ChainlinkVRF Subscription:

```
make createSubscription ARGS="--network sepolia"
```


## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see and output file called `.gas-snapshot`


# Formatting


To run code formatting:
```
forge fmt
```

# Thank you!

If you appreciated this, feel free to follow me or donate!

ETH/Arbitrum/Optimism/Polygon/etc Address: 0x0E127d74D1a5b5d8959173aD3448e6C72D4dD835

[![Kristian Peter Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/kristianpeter)
[![Kristian Peter YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/kristianpeter)
[![Kristian Peter Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kristianpeter/)

