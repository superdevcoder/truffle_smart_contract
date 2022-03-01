pragma solidity ^0.5.1;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IToken {
    // ERC20
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Mint & Burn
    function mint(address account, uint256 amount) external returns (bool);
    function burn(uint256 amount) external;
    function burnFrom(address account, uint256 amount) external;

    // Pause
    function pause() external;
    function unpause() external;

    // Redeem
    function redeem(uint256 amount, bytes32 messageHash) external;
    event TokenRedeemed(address redeemer, uint256 amount, bytes32 messageHash);

    // Permit (signature approvals)
    function permit(address holder, address spender, uint256 nonce, uint256 expiry, bool allowed, uint8 v, bytes32 r, bytes32 s) external;
}
