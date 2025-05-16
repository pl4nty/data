-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000003fe_luac 

-- params : ...
-- function num : 0
TerminateSuspParents = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_1 == 0 then
    return 
  end
  local l_1_2 = l_1_1
  if l_1_1 == nil or l_1_1 < 0 or l_1_1 > 5 then
    l_1_2 = 5
  end
  local l_1_3 = l_1_0
  do
    if l_1_0 == nil or l_1_0 == "" then
      local l_1_4 = (bm.get_current_process_startup_info)()
      if l_1_4 == nil or l_1_4.ppid == nil or l_1_4.ppid == "" then
        return 
      end
      l_1_3 = l_1_4.ppid
    end
    local l_1_5 = {}
    l_1_5["powershell.exe"] = true
    l_1_5["cmd.exe"] = true
    l_1_5["pwsh.exe"] = true
    l_1_5["powershell_ise.exe"] = true
    l_1_5["wsmprovhost.exe"] = true
    l_1_5["wmiprvse.exe"] = true
    l_1_5["winrshost.exe"] = true
    shouldKillParent = function(l_2_0, l_2_1, l_2_2)
    -- function num : 0_0_0
    local l_2_3 = (string.lower)(l_2_1:match("([^\\]+)$"))
    if l_2_3 ~= nil and l_2_2[l_2_3] then
      return true
    end
    return false
  end

    local l_1_6 = (mp.GetParentProcInfo)(l_1_3)
    if l_1_6 ~= nil and l_1_6.ppid ~= nil and l_1_6.image_path ~= nil and shouldKillParent(l_1_6.ppid, l_1_6.image_path, l_1_5) then
      (bm.add_threat_process)(l_1_6.ppid)
      TerminateSuspParents(l_1_6.ppid, l_1_2 - 1)
    end
  end
end

TerminateSuspParents()
return mp.INFECTED

