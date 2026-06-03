# Form chuẩn để tạo Hash hợp lệ cho Block

## 1. Yêu cầu của bài tập (Code Bài 1.1)
Để code chạy đúng, bạn chỉ cần 3 yếu tố:
1. **Dữ liệu đầy đủ:** Nối tất cả các trường (`index`, `timestamp`, `transactions` dạng JSON, `previous_hash`) lại thành một chuỗi duy nhất.
2. **Thuật toán chuẩn:** Sử dụng thuật toán **SHA-256** (ví dụ dùng thư viện `crypto`).
3. **Hàm Băm:** Đưa chuỗi dữ liệu vào băm để lấy mã `current_hash`.

## 2. Yêu cầu thực tế (form chuẩn để trả lời câu hỏi)
Trong môi trường Blockchain thật, một mã Hash chỉ được coi là "Valid" nếu đáp ứng 3 điều kiện ngặt nghèo hơn:
1. **Đóng gói ranh giới rõ ràng (Tránh lỗi đụng độ do nối chuỗi):** Tuyệt đối không nối chuỗi bằng dấu `+`. 
   - *Ví dụ thực tế:* Giao dịch gốc là `Nhận: "ALICE"`, `Tiền: "10"`, `Ghi chú: "0"` ➡️ Nối lại thành chuỗi `"ALICE100"`. Hacker lén sửa thành `Nhận: "ALICE"`, `Tiền: "100"`, `Ghi chú: ""` (xóa trống) ➡️ Nối lại vẫn ra đúng `"ALICE100"`. Mã Hash sinh ra của 2 giao dịch y hệt nhau, hệ thống bị lừa và Hacker ăn cắp được 100 đô la.
   - *Cách giải quyết:* Dữ liệu phải được bọc lại kèm theo **độ dài** của từng biến (VD: `[5]ALICE | [2]10 | [1]0`) để chữ của biến này không bao giờ có thể chạy lấn sang chữ của biến kia.

2. **Băm theo nhóm (Cây Merkle) thay vì băm cả cục:** 
   - *Vấn đề:* Nếu có 10.000 giao dịch, việc gom cả 10.000 cái thành một cục JSON khổng lồ rồi băm là rất nặng nề và dễ bị xáo trộn thứ tự (như đã phân tích ở trên).
   - *Cách giải quyết:* Hệ thống sẽ băm từng giao dịch một, sau đó cứ 2 mã băm lại ghép cặp băm tiếp với nhau, tạo thành hình một cái "Cây". Cứ ghép cặp dần lên tới đỉnh cây, ta được 1 mã băm duy nhất gọi là **Merkle Root** (Rễ cây). Chỉ cần nhét đúng cái Rễ này vào Block là đủ để đại diện (bảo vệ) cho cả 10.000 giao dịch bên dưới mà không lo xáo trộn.

3. **Có Bằng chứng công việc (Biến Nonce / PoW):**
   - *Vấn đề:* Thuật toán băm chạy quá nhanh (chưa tới 1 giây). Hacker có thể dễ dàng tạo ra hàng triệu Block giả mạo để spam đầy mạng lưới.
   - *Cách giải quyết:* Hệ thống ra một điều kiện đánh đố: **Mã Hash sinh ra bắt buộc phải bắt đầu bằng 4 số 0 (VD: `0000abcd...`)**. 
   - *Cách thực hiện (Trò chơi Thử và Sai):* Vì dữ liệu giao dịch bị cố định (không thể sửa), Thợ đào phải nhét thêm một biến trống gọi là `nonce` vào Block để băm thử. 
     - Nhét `nonce = 1` ➡️ Băm ra `x9a...` (Trượt)
     - Nhét `nonce = 2` ➡️ Băm ra `8bc...` (Trượt)
     - ... (Máy tính thử mò hàng tỷ con số) ...
     - Nhét `nonce = 14589201` ➡️ Băm ra **`0000e8f...`** (Trúng thưởng!)
   - *Ý nghĩa:* Việc ép máy tính phải "đoán mò" hàng tỷ lần như vậy ngốn một lượng điện năng khổng lồ. Điều này khiến Hacker cạn kiệt tài chính (phá sản) và không thể spam rác được.
