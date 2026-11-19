-- Threat: !InfrastructureShared
-- Name: 79b36f8bb672
-- Type: 21

function is_in(l_1_0, l_1_1)
  if string.match(l_1_0, l_1_1) ~= nil then
    return true
  else
    return false
  end
end

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if is_in(l_0_0, "mitconfig\\mitconfig\\postsetup") then
    return mp.CLEAN
  end
  if is_in(l_0_0, "\\printix%.net\\printix client") then
    return mp.CLEAN
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
  if is_in(l_0_1, "\\uninstallxpertagent%.ps1") then
    return mp.CLEAN
  end
  if is_in(l_0_1, "\\approot\\bin\\webrolemonitor%.ps1") then
    return mp.CLEAN
  end
  if is_in(l_0_1, "\\uninstallsqe%.ps1") then
    return mp.CLEAN
  end
  if is_in(l_0_1, "\\installstandingqueryextension%.ps1") then
    return mp.CLEAN
  end
  if is_in(l_0_1, "\\program files\\altiris\\altiris agent\\") then
    return mp.CLEAN
  end
  if is_in(l_0_1, "\\chr\\source\\chr-maintenance%.ps1") then
    return mp.CLEAN
  end
  if is_in(l_0_1, "\\addtaskextraskriver%.ps1") then
    return mp.CLEAN
  end
end
local l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[3].utf8p2
end
if l_0_2 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
  end
end
local l_0_6
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_6 = this_sigattrlog[5].utf8p2
end
if l_0_6 ~= nil then
  local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_6)
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if sysio.IsFileExists(l_0_9) then
      bm.add_related_file(l_0_9)
    end
  end
end
return mp.INFECTED
