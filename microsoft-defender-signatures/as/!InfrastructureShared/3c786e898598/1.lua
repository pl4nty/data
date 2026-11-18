-- Threat: !InfrastructureShared
-- Name: 3c786e898598
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if 0 < l_0_1 and l_0_1 < 5 then
  for l_0_3 = 1, l_0_1 do
    local l_0_4 = pe.mmap_string_rva(l_0_2[l_0_3].namerva, 64)
    if l_0_4 == "verifyme" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
