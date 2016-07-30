### Main Resources

Everything from "using-geth.md" and "writing-a-smart-contract.md".

Your web browser's javascript console.<sup>1</sup>  
If it's your first time using it, then instructions should be a quick search away.


#### Deploying a smart contract using browser-solidity's web3 integration

Hopefully you left geth running from before.  
If not, you might need to go through the unlocked default account dance again.  
Even if did leave it running, accounts only stay unlocked for a limited amount of time by default.  
Download your own copy of browser-solidity: https://github.com/ethereum/browser-solidity/archive/gh-pages.zip  
Right now this is overkill, but it's an important step in staying secure anytime you're dealing with the public blockchain and real money.<sup>2</sup>
Unzip the file wherever you like, then open index.html to launch it.  
Paste in the contract from before as something that's easy to test.  
Hit this icon in the top-right: http://imgur.com/YEr7BOP  
Select "Web3 Provider" and hit "OK" in the dialog box that appears.  
Everything's now ready to repeat "writing-a-smart-contract.md" from the step where the red "Create" button is clicked. Only now you have control over where those transactions end up. When running geth connected to the public chain instead of a private one, this is one method of deploying smart contracts to production.

#### Using web3 directly

Open index.html in the web3site folder.  
Open up your javascript console.  
Enter "web3.isConnected()" to check that things are set up correctly.  
You should now have access to everything here: https://github.com/ethereum/wiki/wiki/JavaScript-API  
Go back to browser-solidity and copy the interface of the deployed contract.  http://imgur.com/GIXPRx6  
This describes the available interactions with a contract so that it can be used without needing the full source code for it.  
Go back to the opened index.html from web3site and enter "logContract = web3.eth.contract({interface})" with "{interface}" replaced with the copied interface and "logContract" renamed to something more appropriate if you're using a different contract.  
Copy the address of the deployed instance of the contract. http://imgur.com/wk36RI6
Go back to the open web3site console and enter "logContractInstance = logContract.at('{address}')" (wrapping the address in quotes is necessary, single or double quotes are both acceptable as long as they match) with substitution.  
Enter "logContractInstance.entries(0)" to retrieve your first entry again.  
Set the default account for the web3 connection using "web3.eth.defaultAccount = web3.eth.accounts[0]".  
Add a new entry using "logContractInstance.addEntry('your quoted text here')". You may have to go back into the geth console and unlock the account again first.<sup>3</sup>  
Get your newly added entry (once it's been mined) with "logContractInstance.entries(logContractInstance.totalEntries() - 1)".  
If you have some familiarity with how to make a webpage, then you now know everything you need to start developing smart contracts and html-based interfaces for them.  
Otherwise, check out http://www.w3schools.com/, they're a great place to start learning how to build your own webpages.

---

<sup>1</sup> Assuming GitHub doesn't get much mobile traffic.  
<sup>2</sup> Try skipping this step and you'll probably get a an easily circumvented security error.  
<sup>3</sup> I just remembered that https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_unlockaccount shows how to keep it unlocked until geth is exited. I'm sure there are plenty of other useful bits lurking around in the documentation.
