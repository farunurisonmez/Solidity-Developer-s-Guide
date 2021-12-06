REMIX TEST ERC20<->ERC721 TOKEN PROJECT

<p align="center">
  <img src="https://storage.googleapis.com/fns-blog/public/frontend/assets/images/document/SolidityExamples/spend-ERC20/DApp-ERC20.png" />
</p>

Remix example project is present when Remix loads very first time or there are no files existing in the File Explorer.
It contains 3 directories:

1. 'contracts': Holds three contracts with different complexity level, denoted with number prefix in file name.
2. 'scripts': Holds two scripts to deploy a contract. It is explained below.
3. 'tests': Contains one test file for 'Ballot' contract with unit tests in Solidity.

SCRIPTS

The 'scripts' folder contains example async/await scripts for deploying the 'Storage' contract.
For the deployment of any other contract, 'contractName' and 'constructorArgs' should be updated (along with other code if required).
Scripts have full access to the web3.js and ethers.js libraries.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.

Output from script will appear in remix terminal.

https://ethereum.stackexchange.com/questions/112301/is-this-possible-to-pay-for-erc721-token-with-erc20-token-not-eth
