-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d292c60ec0d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 ~= nil and l_0_0 >= 20480 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC27: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("_log")(".log") do
  -- DECOMPILER ERROR at PC32: Overwrote pending register: R8 in 'AssignReg'

  if ((".access").find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
local l_0_8 = LoadMatchedDataInBuffer()
local l_0_9 = "wget http://[%d]+%.[%d]+%.[%d]+%.[%d]+/[/%w%.%-_]+;%s*chmod%s%+x%s[/%w%.%-_]+;%s+[/%w%.%-_]+"
if GetPatternOccurenceCount(l_0_8, l_0_9) > 8 then
  return mp.INFECTED
end
return mp.CLEAN

