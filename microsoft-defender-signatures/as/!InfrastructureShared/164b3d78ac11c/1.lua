-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\164b3d78ac11c\1.luac 

-- params : ...
-- function num : 0
if (MpCommon.GetPersistContextCountNoPath)("CreatedAppDataMsi") > 0 then
  local l_0_0 = (MpCommon.GetPersistContextNoPath)("CreatedAppDataMsi")
  if l_0_0 ~= nil then
    for l_0_4,l_0_5 in ipairs(l_0_0) do
      if (sysio.IsFileExists)(l_0_5) then
        (bm.add_related_file)(l_0_5)
      end
    end
  end
  do
    do
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

