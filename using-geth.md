### Main Resources
Geth (Go Ethereum), the latest versions are available here: https://github.com/ethereum/go-ethereum/releases  
Grab the flavor for your operating system of choice.

Fancy launch scripts and a genesis file. Both provided in the "geth-toolkit" folder (geth not included).

That's it for now.<sup>1</sup>

#### Intro to Geth

The first step can be a daunting one when it's still unfamiliar.  
Add `geth` to your path.  
Searching "add to path {your operating system}" with the appropriate substitution and minus the braces and quotes should bring up some decent instructions to learn from.

Next is setting up a private blockchain to test with.
Go into the provided `geth-toolkit` and launch the appropriate setupChain script:  

* `setupChain.sh` for Linux and Mac OS X  
* `setupChain.ps1` for Windows 8/10 (for older Windows versions rename `setupChain.ps1` to .`setupChain.bat`)

Follow that up by running the correct version (extension) of the `runChain` command.

For a more detailed look at what's going on, check out [Creating a Private Chain/Testnet](https://souptacular.gitbooks.io/ethereum-tutorials-and-tips-by-hudson/content/private-chain.html) which describes the various command-line options in more depth than running `geth -h`. Things have changed slightly since it was written, notably with how `geth` handles the genesis file.

Now for some drills on doing basic actions using `geth` (keep in mind that `geth` is geared towards development unlike *Mist* which targets civilian use): 
 
1. Once geth is running and has its console ready for your input, enter `eth.accounts`. Unless you got fancy, this should come back with "[]" showing there are none yet.  
2. Enter `personal.newAccount()` to make one. Probably leave the password blank since this private blockchain doesn't put anything valuable at risk and accounts on it are throwaways.  
If you enter `eth.accounts` again, you should see your newly created account displayed.  
3. To get some money to play with, enter `miner.start()` and wait a little while for the rewards to start rolling in. Except right now it probably just gives an error since it doesn't know where to put those rewards. If your machine cries for mercy, then `miner.stop()` will provide it. Just remember that more mining is necessary anytime you make a new transaction in order to confirm it.  
4. Set your default account by entering `eth.defaultAccount = eth.accounts[0]`.  
Now try to start mining again.  
There's a large amount of data that has to be generated to get things rolling, so be prepared to wait a few minutes or more before a stream of messages starts crawling up your screen.  
5. Since entering in commands amidst that mess would be an unpleasant task, use the extraConsole script to get a fresh one minus the noise.  
6. Make another account.  
7. Set the default account again.  
8. Enter `personal.unlockAccount[eth.defaultAccount]` to unlock it.  
9. Enter `eth.sendTransaction({to: eth.accounts[1], value: 42})` to send money from your default account to your new one.  
Enter `eth.getBalance(eth.accounts[1])` to see that the transfer succeeded.  

If you want to keep poking around the `geth` console, check out [Management API Reference](https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console#management-api-reference) for a full list of commands.

---

<sup>1</sup> *Solc* (Solidity Compiler) is also nice to have, but browser-solidity has your needs covered up until build automation. At that point you'll want to check out [webthree-umbrella](https://github.com/ethereum/webthree-umbrella) since right now it's the best place to get an included binary for `solc`.
