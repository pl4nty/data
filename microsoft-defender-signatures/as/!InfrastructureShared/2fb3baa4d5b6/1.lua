-- Threat: !InfrastructureShared
-- Name: 2fb3baa4d5b6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = this_sigattrlog[1]
if not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2 = l_0_0.utf8p2
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1:sub(-3) ~= "/sh" and l_0_1:sub(-5) ~= "/bash" and l_0_1:sub(-5) ~= "/dash" then
  return mp.CLEAN
end
local l_0_3 = false
for l_0_4, l_0_5 in l_0_2:gmatch("%f[%w]base64%s+(%-%-?%a+)%s*>>?%s*[\"']?(/[^%s\"'<>|;&()]+)") do
  if (l_0_4 == "-d" or l_0_4 == "--decode") and l_0_5:sub(-4) == ".jsp" then
    l_0_3 = true
  end
end
if not l_0_3 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1505.003", "EncodedJspDrop")
add_parents()
return mp.INFECTED
