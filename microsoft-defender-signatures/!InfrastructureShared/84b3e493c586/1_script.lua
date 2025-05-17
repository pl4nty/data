-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3e493c586\1_luac 

-- params : ...
-- function num : 0
file_time = function(l_1_0)
  -- function num : 0_0
  if not l_1_0 then
    return nil
  end
  l_1_0 = (string.lower)((MpCommon.PathToWin32Path)(l_1_0))
  if not (sysio.IsFileExists)(l_1_0) then
    return nil
  end
  local l_1_1 = (sysio.GetFileLastWriteTime)(l_1_0)
  if not ((sysio.GetLastResult)()).Success or l_1_1 == 0 then
    return nil
  end
  l_1_1 = l_1_1 / 10000000 - 11644473600
  local l_1_2 = (MpCommon.GetCurrentTimeT)()
  if l_1_2 <= l_1_1 then
    return nil
  end
  return (l_1_2 - (l_1_1)) / 60
end

local l_0_0 = file_time((bm.get_imagepath)())
do
  if l_0_0 ~= nil and l_0_0 <= 60 then
    local l_0_1 = mp.CLEAN
    if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
      l_0_1 = reportGenericRansomware((this_sigattrlog[1]).utf8p2, true)
    else
      if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
        l_0_1 = reportGenericRansomware((this_sigattrlog[2]).utf8p2, true)
      end
    end
    if l_0_1 == mp.INFECTED then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

