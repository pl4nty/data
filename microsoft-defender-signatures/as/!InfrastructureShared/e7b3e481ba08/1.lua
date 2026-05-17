-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e7b3e481ba08\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[5]).matched or isnull((this_sigattrlog[5]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[5]).utf8p1)
do
  if not (string.find)(l_0_0, "\\google\\chrome\\application\\", 1, true) and not (string.find)(l_0_0, "\\microsoft\\edge\\application\\", 1, true) and not (string.find)(l_0_0, "\\microsoft\\edgewebview\\application\\", 1, true) then
    local l_0_1, l_0_3, l_0_5, l_0_7, l_0_9, l_0_11, l_0_13 = (string.find)(l_0_0, "\\brave-browser\\application\\", 1, true)
  end
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  do
    local l_0_2, l_0_4, l_0_6, l_0_8, l_0_10, l_0_12, l_0_14 = , l_0_0:match("([^\\]+)$") or ""
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC68: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC76: Confused about usage of register: R2 in 'UnsetPending'

    if l_0_4 == "chrome_elf.dll" or l_0_4 == "chrome_proxy.dll" or l_0_4 == "mojo_core.dll" or l_0_4 == "elevation_service.dll" or l_0_4 == "msedge_elf.dll" or l_0_4 == "msedgewebview2.dll" then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
      return mp.CLEAN
    end
    if checkFileLastWriteTime(l_0_0, 604800) == false then
      return mp.CLEAN
    end
    ;
    (bm.add_related_file)(l_0_0)
    TrackPidAndTechniqueBM("BM", "T1574.001", "SuspBrowserAppDirSideLoad")
    return mp.INFECTED
  end
end

