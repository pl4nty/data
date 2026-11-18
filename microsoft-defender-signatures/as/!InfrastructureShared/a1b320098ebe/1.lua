-- Threat: !InfrastructureShared
-- Name: a1b320098ebe
-- Type: 21

function TerminateSuspParents(l_1_0, l_1_1)
  if l_1_1 == 0 then
    return
  end
  local l_1_2 = l_1_1
  if l_1_1 == nil or l_1_1 < 0 or 5 < l_1_1 then
    l_1_2 = 5
  end
  local l_1_3 = l_1_0
  if l_1_0 == nil or l_1_0 == "" then
    local l_1_4 = bm.get_current_process_startup_info()
    if l_1_4 == nil or l_1_4.ppid == nil or l_1_4.ppid == "" then
      return
    end
    l_1_3 = l_1_4.ppid
  end
  local l_1_5 = {
    ["powershell.exe"] = true,
    ["cmd.exe"] = true,
    ["pwsh.exe"] = true,
    ["powershell_ise.exe"] = true,
    ["wsmprovhost.exe"] = true,
    ["wmiprvse.exe"] = true,
    ["winrshost.exe"] = true
  }
  
  local function l_1_6(l_2_0, l_2_1, l_2_2)
    local l_2_3 = string.lower(l_2_1:match("([^\\]+)$"))
    if l_2_3 ~= nil and l_2_2[l_2_3] then
      return true
    end
    return false
  end
  
  local l_1_7 = mp.GetParentProcInfo(l_1_3)
  if l_1_7 ~= nil and l_1_7.ppid ~= nil and l_1_7.image_path ~= nil and l_1_6(l_1_7.ppid, l_1_7.image_path, l_1_5) then
    bm.add_threat_process(l_1_7.ppid)
    TerminateSuspParents(l_1_7.ppid, l_1_2 - 1)
  end
end

TerminateSuspParents()
return mp.INFECTED
