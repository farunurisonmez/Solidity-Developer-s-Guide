<h1 align="center">Solidity - Şifreleme Fonksiyonları</h1>
<p>Solidity, yerleşik şifreleme işlevleri de sağlar. Aşağıdakiler önemli yöntemlerdir.</p>
<ul>
  <li><b>keccak256(bytes memory) returns (bytes32)</b> − Giren değerin(input) Keccak-256 hash değerini hesaplar.</li>
  <li><b>sha256(bytes memory) returns (bytes32)</b> − Giren değerin SHA-256 değerini hesaplar.</li>
  <li><b>ripemd160(bytes memory) returns (bytes20)</b> − compute RIPEMD-160 hash of the input.</li>
  <li><b>ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns (address)</b> − genel anahtarla ilişkilendirilmiş adresi eliptik eğri imzasından kurtarır veya hata durumunda sıfır döndürür.</li>
</ul>

<h2 align="left">Not</h2>
<p>Ecrecover fonksiyonu bir adres döndürür, bu adres non-payable türündedir. Kurtarılan adrese para aktarmanız gerekebilir diye, dönüşüm için payable türünde bir adres kullanılması gerekir.</p>
<p>Keccak256 0.5.0 sürümünden önce sha3 adıyla biliniyordu. Şuanda sha3 kullanılmıyor.</p>
