// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Context.sol";
import "./ERC20Deflationary.sol";

contract ExampleToken is Context, ERC20Deflationary {

    string private name_ = "omrtoken";
    string private symbol_ = "omrtst";
    uint8 private decimal_ = 18;
    uint256 private tokenSupply_ = 100;
    uint8 private taxBurn_ = 1;
    uint8 private taxReward_ = 2;
    uint8 private taxLiquify_ = 1;
    uint8 private taxDecimals_ = 0;
    uint256 private minTokensBeforeSwap_ = (1000) * (10 ** decimal_);

    constructor () ERC20Deflationary(name_, symbol_, decimal_, tokenSupply_) {
        enableAutoBurn(taxBurn_, taxDecimals_);
        enableReward(taxReward_, taxDecimals_);
    }

}