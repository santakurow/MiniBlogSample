window.addEventListener("trix-file-accept", function (e) {
  const imageTypes = ["image/png", "image/jpeg", "image/gif"];
  if (!imageTypes.includes(e.file.type)) {
    e.preventDefault();
    alert("画像の拡張子は'png', 'jpeg', 'gif'のいずれかにしてください。");
  }
  const maxSize = 1024 * 1024;
  if (e.file.size > maxSize) {
    e.preventDefault();
    alert("画像の容量が大きいです！ 1MB以下にしてください。");
  }
})