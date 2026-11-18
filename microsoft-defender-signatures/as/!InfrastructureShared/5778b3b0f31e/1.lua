-- Threat: !InfrastructureShared
-- Name: 5778b3b0f31e
-- Type: 21

local l_0_0 = mp.getfilesize()
if 4000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_ismsil") then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("syswow64", 1, true) then
  return mp.CLEAN
end
if hstrlog[4].matched and hstrlog[4].VA > 38 then
  local l_0_2 = pe.mmap_va(hstrlog[4].VA - 38, 38)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  for l_0_3 = 1, #l_0_2 - 1 do
    local l_0_4 = string.byte(l_0_2, l_0_3)
    local l_0_5 = string.byte(l_0_2, l_0_3 + 1)
    if l_0_4 == 106 and (233 <= l_0_5 or l_0_5 <= 255) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
