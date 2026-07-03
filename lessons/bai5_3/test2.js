const { createPublicClient, http, parseAbi } = require('viem');
const { arbitrumSepolia } = require('viem/chains');

// Khởi tạo client kết nối với mạng Arbitrum Sepolia (Dùng public RPC)
const client = createPublicClient({
    chain: arbitrumSepolia,
    transport: http('https://sepolia-rollup.arbitrum.io/rpc')
});

async function main() {
    console.log("Reading smart contract");

    try {
        const data = await client.readContract({
            address: '0xb3eb1776249e1a20a611ac553f9a96389049523e',
            abi: parseAbi([
                "function getCount() public view returns (uint)",
                "function increment() public"
            ]),
            functionName: 'getCount',
        });
        const count = BigInt(data);
        // Do trong Solidity khai báo là uint (viết tắt của uint256 - kiểu số nguyên khổng lồ), 
        // Viem luôn trả về kiểu BigInt (có chữ n) để tránh sai số. Phải dùng .toString() để bỏ chữ n đi.
        console.log("Count", count.toString());
    } catch (error) {
        console.error(error.shortMessage || error.message);
    }
}

main();
