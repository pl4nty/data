-- Threat: !InfrastructureShared
-- Name: !#Certificate:Certum!Lowfi
-- Type: 12

local function l_0_0(l_1_0, l_1_1)
  if l_1_0 == nil then
    return false
  end
  local l_1_2 = 0
  for l_1_3, l_1_4 in ipairs(l_1_0) do
    l_1_2 = l_1_2 + 1
    local l_1_5 = l_1_0[l_1_2]
    local l_1_6 = l_1_5.FingerprintSha1
    if l_1_6 == nil then
      return false
    end
    if l_1_6.HashType ~= "SHA1" then
      return false
    end
    local l_1_7 = l_1_6.Hash
    if l_1_7 == nil then
      return false
    end
    if l_1_1[l_1_7] then
      return true
    end
    break
  end
end

local l_0_1 = mp.GetCertificateInfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  ["\245\178Oe\207$\192\143_\233\187Np\183\185D2\251p\v"] = true,
  ["\006o\200T\204\205s\149!\175\238\239\fC\255\205j\017k\191"] = true,
  ["\209\159\b\200\020{\231\167\a\130\250\147k\023C\031Oj\023\251"] = true,
  ["\130~r5=i\016\169\222\199\243\209\006\022v\232\003V\253S"] = true,
  [".\13544\140\0039\r$\250\249n\134\187\001\179\158:\212\219"] = true,
  ["z\001\240\"\162\002BE}u6\t\223\255\0005\228\1623\244"] = true,
  ["1\170\202;\141\030\131D\181\tu\166\196}\218\026\1707E\188"] = true
}
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_0(l_0_4.Certificates, l_0_2) then
    return mp.INFECTED
  end
  break
end
return mp.CLEAN
