-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fb3ff352b1c\1_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched then
    local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
    ;
    (MpCommon.AppendPersistContextNoPath)("CreatedAppDataMsi", l_0_0, 10)
  end
  return mp.CLEAN
end

