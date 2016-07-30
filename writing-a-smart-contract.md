### Main Resources

Online editor with a dash of IDE: https://ethereum.github.io/browser-solidity<sup>1</sup>  
Documentation: http://solidity.readthedocs.io/

#### Quick Intro to Browser-Solidity

First Screen: http://imgur.com/a/qK9KM

Hit the "New File" button in the top-left corner of the page.  
Paste in this contract to have something quicker to work with than the original liquid voting example:

    // anyone can write an entry in this visitor log
    contract VisitorLog {
        mapping (uint => string) public entries;
        uint public totalEntries;

        function addEntry(string entry){
            // add your entry to the next spot in the log and increment the total
            entries[totalEntries++] = entry;
        }
    }

Click the red "Create" button in the testing/deployment menu (this one: http://imgur.com/a/5aO5f, if it's not there then wait for the contract to finish compiling).<sup>2</sup>  
Enter "Hello Ethereum" (with quotes!) into the input field to the right of the red "addEntry" button. Then click the "addEntry" button to execute a transaction<sup>3</sup> that uses the function.  
Enter "0" (quotes optional) next to "entries", then click it to make a call<sup>4</sup> to the function and read back what you entered.

You now have everything you need for getting familiar with Solidity.  
Check out the Solidity documentation for more complex examples, support for other editors, and ideas for what to try and learn next.

---

<sup>1</sup> Apologies for the Mix IDE fiasco before.  
Browser-Solidity now has some support for trying out contracts, making it my current recommendation for the best place to start. It's still a little rough around the edges but a far cry from before.

<sup>2</sup> Red indicates a button will have an effect on the blockchain, blue indicates only reading from it. By default browser-solidity creates a private blockchain for testing purposes. If you set it up to connect to the public blockchain, then make certain you're doing exactly what you want to do and nothing else. It's very easy to lose money if anything goes wrong.

<sup>3</sup> More database transaction than financial transaction in this case. Though it will still cost a very small amount to cover using the Ethereum network's resources. Or rather it would if this was happening on the public Ethereum blockchain.

<sup>4</sup> There's a distinction between calls and transactions. Calls are also an ambiguous term depending on context. Short version: calls don't affect the blockchain, transactions do. Longer version: http://ethereum.stackexchange.com/questions/765/what-is-the-difference-between-a-transaction-and-a-call
