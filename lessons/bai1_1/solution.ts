import crypto from "crypto"; // Import thư viện để mã hóa

export type Block = {
  index: number;
  timestamp: string;
  transactions: any[];
  previous_hash: string;
  current_hash: string;
};

export function isValidBlock(block: Block): boolean {
  // 1. Ghép các thuộc tính của block lại thành 1 chuỗi
  const value = block.index + block.timestamp + JSON.stringify(block.transactions) + block.previous_hash;

  // 2. Tính toán mã băm (hash) bằng SHA-256
  const calculatedHash = crypto.createHash('sha256').update(value).digest('hex');

  // 3. Kiểm tra xem hash tính được có khớp với current_hash hay không
  return calculatedHash === block.current_hash;
}
