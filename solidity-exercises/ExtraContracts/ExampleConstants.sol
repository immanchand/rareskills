**contract ExampleERC20 {

    uint256 public constant MAX_SUPPLY = 22_000_000;
    // erc20 code

    function mint(unint256 amount) external {
        require(totalSupply() + amount <= MAX_SUPPLY, "max supply exceeded");
        balanceOf[msg.sender] += amount;

        emit Transfer(address(0), msg.sender, amount);
    }
    // rest of the erc20 code
}**
