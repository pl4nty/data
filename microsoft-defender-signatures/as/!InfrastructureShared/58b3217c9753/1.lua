-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\58b3217c9753\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = ExtractPartsFromUri(tostring(l_0_0.utf8p1))
local l_0_2 = (string.lower)(tostring(l_0_1.host or ""))
l_0_2 = (string.gsub)(l_0_2, "%.$", "")
if not (string.match)(l_0_2, "%.monster$") or l_0_1.path ~= "" or l_0_1.query == nil or l_0_1.query == "" then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(tostring(l_0_0.utf8p2))
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC75: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R7 in 'AssignReg'

  if not ("iex")("invoke-expression", "invoke-webrequest") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

