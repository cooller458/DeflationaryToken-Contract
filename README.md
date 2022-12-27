# ERC20Deflationary
.secret.example dosyasının içine cüzdan seedPhrase veya Private Key yazılmalıdır.
```
npm install
```
Truffle kurulumu için
```
npm install -g truffle
```
Ganache kurulumu için
```
npm install -g ganache-cli
```
## How to run test:
```
truffle test
```
## Deploy
```
truffle migrate --network testnet
```
## Verify
```
truffle run verify ExampleToken --network testnet
```

# ERC20Deflationary

Example token kontratı içerisinde ki verileri input değer olarak bırakıp orada ki değerleri kullanıcılara girdi olarak gönderebilirsiniz. Fee düzenlemeleri *ExampleToken.sol*
üzerinden yapılabilir.
Burn Address ERC20Deflationary.sol içerisindeki burnAddress değişkeni ile değiştirilebilir.

## What is ERC20Deflationary?

ERC20Deflationary, ERC20 standardını uygulayan ve ona deflasyonist özellikler ekleyen akıllı bir sözleşmedir.


## How to use:

Clone this git repo and import ERC20Deflationary.sol

Example:

```
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Context.sol";
import "./ERC20Deflationary.sol";

contract ExampleToken is Context, ERC20Deflationary {

    string private name_ = "ExampleToken";
    string private symbol_ = "EXT";
    uint8 private decimal_ = 9;
    uint256 private tokenSupply_ = 10 ** 12;
    uint8 private taxBurn_ = 10;
    uint8 private taxReward_ = 10;
    uint8 private taxLiquify_ = 10;
    uint8 private taxDecimals_ = 0;
    uint256 private minTokensBeforeSwap_ = (10 ** 6) * (10 ** decimal_);
    address private routerAddress = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    constructor () ERC20Deflationary(name_, symbol_, decimal_, tokenSupply_) {
        enableAutoBurn(taxBurn_, taxDecimals_);
        enableReward(taxReward_, taxDecimals_);
        enableAutoSwapAndLiquify(taxLiquify_, taxDecimals_, routerAddress, minTokensBeforeSwap_);
    }

}
```

## How to run test:

In the terminal

```
truffle test
```
## Deploy
```
truffle migrate --network testnet
```
## Verify
```
truffle run verify ExampleToken --network testnet
```
