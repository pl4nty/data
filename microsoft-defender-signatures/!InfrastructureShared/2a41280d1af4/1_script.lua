-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2a41280d1af4\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawRequestBlob)()
local l_0_1, l_0_2, l_0_3 = (MpCommon.BinaryRegExpSearch)("MGLNDD_((?:[0-9]{1,3}\\.){3}[0-9]{1,3})_([0-9]{1,5})", l_0_0)
do
  if l_0_1 and l_0_2 and l_0_3 then
    local l_0_4 = {}
    l_0_4.ip = tostring(l_0_2)
    l_0_4.port = tostring(l_0_3)
    ;
    (nri.AddTelemetry)(0, l_0_4)
    return mp.INFECTED
  end
  return mp.CLEAN
end

