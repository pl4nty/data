-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\117b3c806b238\1.luac 

-- params : ...
-- function num : 0
do
  if isTamperProtectionOn(false) then
    local l_0_0 = (bm.get_imagepath)()
    if l_0_0 then
      (mp.ReportLowfi)(l_0_0, 1443100823)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

