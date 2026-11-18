-- Threat: !InfrastructureShared
-- Name: 3078fe0801f7
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_3 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].Size
if 100000 < l_0_3 then
  local l_0_4, l_0_5 = pe.get_exports()
  if 200 < l_0_4 then
    local l_0_6
    for l_0_7 = 1, l_0_4 do
      if l_0_6 ~= nil and l_0_5[l_0_7].rva == l_0_6 then
        return mp.INFECTED
      end
      if l_0_5[l_0_7].fn == 2750976013 or l_0_5[l_0_7].fn == 2955234196 then
        l_0_6 = l_0_5[l_0_7].rva
      end
    end
  end
end
return mp.CLEAN
