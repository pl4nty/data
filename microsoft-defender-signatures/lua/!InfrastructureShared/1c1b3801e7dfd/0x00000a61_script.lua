-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1c1b3801e7dfd\0x00000a61_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.ppid == nil then
  return mp.CLEAN
end
if not isParentPackageManager(l_0_0.ppid, true) then
  local l_0_1 = nil
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
    l_0_1 = (this_sigattrlog[8]).utf8p2
  else
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
      l_0_1 = (this_sigattrlog[9]).utf8p1
      local l_0_2 = nil
      if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p2 ~= nil then
        l_0_2 = (this_sigattrlog[12]).utf8p2
      else
        if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p2 ~= nil then
          l_0_2 = (this_sigattrlog[15]).utf8p2
        end
      end
      if l_0_1 ~= l_0_2 then
        return mp.CLEAN
      end
    end
  end
  do
    do
      if l_0_1 ~= nil and (string.match)(l_0_1, "/%.[^/]+$") then
        TrackPidAndTechniqueBM("BM", "T1059.004", "Execution_CommandandScriptingInterpreter_UnixShell_HiddenParent")
        ;
        (bm.add_related_file)(l_0_1)
        reportRelatedBmHits()
        addRelatedProcess()
        return mp.INFECTED
      end
      do return mp.CLEAN end
      return mp.CLEAN
    end
  end
end

