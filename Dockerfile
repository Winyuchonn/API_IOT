# ใช้ Python base image
FROM python:3.9-slim

# ตั้งค่า directory สำหรับแอป
WORKDIR /app

# คัดลอก requirements.txt ไปยัง container
COPY requirements.txt .

# ติดตั้ง dependencies
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกโค้ดแอปไปยัง container
COPY . .

# เปิดพอร์ตสำหรับใช้งานแอป
EXPOSE 8000

# คำสั่งในการรันแอป FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
