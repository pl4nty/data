-- Threat: !InfrastructureShared
-- Name: 47292c10af0e
-- Type: 21

local l_0_0 = mp.getfilesize()
if 98304 < l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 81920 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if string.find(l_0_1, "\n", 1, true) ~= nil then
  return mp.CLEAN
end
if string.match(l_0_1, "%(function%((%x%x%x%x%x%x%x%x%x%x+),(%x%x%x%x%x%x%x%x%x%x+),(%x%x%x%x%x%x%x%x%x%x+),(%x%x%x%x%x%x%x%x%x%x+),(%x%x%x%x%x%x%x%x%x%x+),(%x%x%x%x%x%x%x%x%x%x+)") == nil then
  return mp.CLEAN
end
mp.set_mpattribute("SCRIPT:Worm:JS/Proslikefan_Lowfi3")
return mp.CLEAN
