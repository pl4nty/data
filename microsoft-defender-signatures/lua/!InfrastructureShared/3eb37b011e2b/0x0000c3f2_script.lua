-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3eb37b011e2b\0x0000c3f2_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil or (string.len)(l_0_0) < 1 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
if (string.find)(l_0_1, "\\program files", 1, true) ~= nil or (string.find)(l_0_1, "\\mpsigstub.exe", 1, true) ~= nil or (string.find)(l_0_1, "\\mpcmdrun.exe", 1, true) ~= nil then
  return mp.CLEAN
end
do
  if (string.sub)(l_0_1, -16) == "\\threatsonar.exe" then
    local l_0_2 = (mp.IsKnownFriendlyFile)(l_0_1, true, false)
    if l_0_2 ~= nil and l_0_2 == true then
      return mp.CLEAN
    end
  end
  if (string.find)(l_0_0, "\\lsass.exe", 1, true) then
    local l_0_3, l_0_4 = (bm.get_process_relationships)()
    if l_0_3 then
      for l_0_8,l_0_9 in ipairs(l_0_3) do
        if l_0_9.image_path ~= nil and (mp.bitand)(l_0_9.reason_ex, 2) == 2 then
          local l_0_10 = (string.lower)(l_0_9.image_path)
          if (string.find)(l_0_10, "\\dell secureworks\\red cloak\\[^\\]+\\entwine.exe") or (string.find)(l_0_10, "\\program files\\morphisec\\bin\\protectorservice64.exe", 1, true) or (string.find)(l_0_10, "\\sentinelone\\sentinel agent[^\\]+\\sentinelagent.exe") then
            return mp.CLEAN
          end
        end
      end
    end
  end
  do
    l_0_3 = TrackCustomPersistContextNameByPPID
    l_0_4 = "query"
    l_0_3 = l_0_3(l_0_4, "bm", "MimikatzTrigger")
    if l_0_3 == true then
      l_0_3 = mp
      l_0_3 = l_0_3.INFECTED
      return l_0_3
    end
    l_0_3 = mp
    l_0_3 = l_0_3.CLEAN
    return l_0_3
  end
end

