-- Threat: !InfrastructureShared
-- Name: 2ed05866502f
-- Type: 21

if headerpage == nil then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 20 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 76 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 5) ~= 136193 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 9) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 13) ~= 192 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 17) ~= 1174405120 then
  return mp.CLEAN
end
return mp.INFECTED
