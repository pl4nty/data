-- Threat: Rogue:Win32/Trapwot
-- Type: 9

local function l_0_0(l_1_0, l_1_1)
  if l_1_0 == nil and l_1_1 == nil then
    return false
  end
  for l_1_2, l_1_3 in ipairs(l_1_0) do
    local l_1_4 = l_1_3.Fingerprint
    if l_1_4 == nil then
      return false
    end
    if l_1_4.HashType ~= "SHA1" then
      return false
    end
    local l_1_5 = l_1_4.Hash
    if l_1_5 == nil then
      return false
    end
    if l_1_1[l_1_5] then
      return true
    end
    break
  end
  return false
end

local l_0_1 = mp.GetCertificateInfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  ["\031> =*\139\240\211\197#\246tB\160\006W\131\160\179#"] = true
}
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.AuthenticodeContentType ~= "PE" then
    return mp.CLEAN
  end
  if l_0_0(l_0_4.Signers, l_0_2) then
    if mp.get_mpattribute("RPF:PEHasIOAVURL") and mp.get_mpattribute("RPF:TopLevelFile") then
      return mp.INFECTED
    end
    mp.set_mpattribute("Lua:Win32/TrapwotCert.A")
  end
  break
end
return mp.CLEAN
