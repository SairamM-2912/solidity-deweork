// SPDX-License-Identifier: GPL-3.0
pragma solidity =0.8.34;

import {FreelancerProfile} from "./types/DeworkTypes.sol";

contract Dework {
    uint256 connectFee;
    address public initialOwner;

    FreelancerProfile[] public freelancerprofile;

    constructor(address _initialOwner) {
        initialOwner = _initialOwner;
    }

    function getNumberOfRegisteredFreelancers()
        public
        view
        returns (uint256)
    {
        return freelancerprofile.length;
    }

    function registerFreelancerProfile(
        string calldata name,
        uint8 yearsOfExperience,
        uint256 hourlyRateWei
    ) external {
        uint256 freelancerId = getNumberOfRegisteredFreelancers();

        FreelancerProfile memory freelancerProfile = FreelancerProfile({
            id: freelancerId,
            name: name,
            wallet: msg.sender,// msg.sender --->Global Sender
            experienceYears: yearsOfExperience,
            isAvailableHire: true,
            HourlyRateWei: hourlyRateWei
        });

        freelancerprofile.push(freelancerProfile);
    }

    function getFreelancerProfile() public view returns(FreelancerProfile[] memory){
            return freelancerprofile;    

    }

}