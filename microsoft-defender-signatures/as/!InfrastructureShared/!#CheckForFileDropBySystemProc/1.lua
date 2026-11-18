-- Threat: !InfrastructureShared
-- Name: !#CheckForFileDropBySystemProc
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: Lua:NewWrittenBySystemProcess & (!Lua:RemoteCopyExclusions)

if mp.ENGINEBUILD > 19850 and not mp.get_mpattribute("Lua:RemoteContextPresent") then
  mp.set_mpattribute("Lua:RemoteCopyExclusions")
  return mp.CLEAN
end

function SetAttributeAndContext(l_1_0, l_1_1, l_1_2)
  local l_1_3 = MpCommon.QueryPersistContext(l_1_0, l_1_1)
  if not l_1_3 then
    MpCommon.AppendPersistContext(l_1_0, l_1_1, 100)
  end
  mp.set_mpattribute(l_1_2)
end

local l_0_0 = mp.CLEAN
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1:sub(1, 8) == "\\device\\" then
  l_0_1 = MpCommon.PathToWin32Path(l_0_1)
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2:sub(1, 8) == "\\device\\" then
  l_0_2 = MpCommon.PathToWin32Path(l_0_2)
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = {
  ["c:\\windows\\system32"] = "sysdir",
  ["c:\\windows"] = "windir",
  ["c:\\windows\\temp"] = "wintemp",
  ["c:\\users\\public\\desktop"] = "usrprofpub",
  ["c:\\users\\public\\documents"] = "usrprofpub",
  ["c:\\users\\default\\documents"] = "usrprofdef",
  ["c:\\users\\default\\desktop"] = "usrprofdef",
  ["c:\\perflogs"] = "perflog",
  ["c:"] = "c_root",
  ["d:"] = "d_root",
  ["e:"] = "e_root",
  ["f:"] = "f_root",
  ["g:"] = "g_root",
  ["h:"] = "h_root",
  ["i:"] = "i_root",
  ["j:"] = "j_root",
  ["k:"] = "k_root",
  ["l:"] = "l_root",
  ["m:"] = "m_root",
  ["n:"] = "n_root",
  ["o:"] = "o_root",
  ["p:"] = "p_root",
  ["q:"] = "q_root",
  ["r:"] = "r_root",
  ["s:"] = "s_root",
  ["t:"] = "t_root",
  ["u:"] = "u_root",
  ["v:"] = "v_root",
  ["w:"] = "w_root",
  ["x:"] = "x_root",
  ["y:"] = "y_root",
  ["z:"] = "z_root"
}
local l_0_4 = l_0_3[l_0_1]
local l_0_5 = "FileDropBySystemProc_"
local l_0_6 = "Lua:Context/FileDropBySystemProc!"
if mp.get_mpattribute("BM_MZ_FILE") then
  l_0_5 = "ExeFileDropBySystemProc_"
  l_0_6 = "Lua:Context/ExeFileDropBySystemProc!"
  mp.set_mpattribute("Lua:SuspExeFileDropBySystemProc")
  AppendToRollingQueue("SuspExeFileDroppedViaSMB", l_0_2, nil, 5000)
else
  mp.set_mpattribute("Lua:SuspFileDropBySystemProc")
  AppendToRollingQueue("SuspFileDroppedViaSMB", l_0_2, nil, 5000)
end
if l_0_3[l_0_1] ~= nil then
  local l_0_7 = l_0_5 .. l_0_4
  local l_0_8 = l_0_6 .. l_0_4
  SetAttributeAndContext(l_0_2, l_0_7, l_0_8)
  if l_0_4:find("_root", 1, true) then
    mp.set_mpattribute("Lua:Context/FileDropBySystemAtRoot")
  end
  return mp.INFECTED
end
if mp.get_mpattribute("Lua:CloudBlockLevelGT3") or mp.get_mpattribute("Lua:TT:DetectionThresholdMet") then
  local l_0_9 = false
  if l_0_1:match("c:\\users\\.-\\appdata\\.-\\microsoft\\windows\\start menu\\programs\\startup") then
    l_0_4 = "startup"
    local l_0_10 = l_0_5 .. l_0_4
    local l_0_11 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_10, l_0_11)
    l_0_0 = mp.INFECTED
    l_0_9 = true
  end
  if l_0_1:match("c:\\users\\.-\\desktop\\[^\\]*$") then
    l_0_4 = "desktop"
    local l_0_12 = l_0_5 .. l_0_4
    local l_0_13 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_12, l_0_13)
    l_0_0 = mp.INFECTED
  end
  if l_0_1:match("c:\\users\\.-\\appdata\\local\\temp") then
    l_0_4 = "usrtemp"
    local l_0_14 = l_0_5 .. l_0_4
    local l_0_15 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_14, l_0_15)
    l_0_0 = mp.INFECTED
    l_0_9 = true
  end
  if not l_0_9 and l_0_1:match("c:\\users\\.-\\appdata\\local\\") then
    l_0_4 = "appdatalocal"
    local l_0_16 = l_0_5 .. l_0_4
    local l_0_17 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_16, l_0_17)
    l_0_0 = mp.INFECTED
  end
  if l_0_1:match("c:\\windows\\system32\\config\\systemprofile") and not l_0_1:find("\\appdata\\", 1, true) then
    l_0_4 = "sysprof"
    local l_0_18 = l_0_5 .. l_0_4
    local l_0_19 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_18, l_0_19)
    l_0_0 = mp.INFECTED
  end
  if l_0_1:match("c:\\windows\\system32\\config\\systemprofile\\appdata") then
    l_0_4 = "sysappdata"
    local l_0_20 = l_0_5 .. l_0_4
    local l_0_21 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_20, l_0_21)
    l_0_0 = mp.INFECTED
  end
  if l_0_1:match("c:\\windows\\system32\\spool\\") then
    l_0_4 = "spool"
    local l_0_22 = l_0_5 .. l_0_4
    local l_0_23 = l_0_6 .. l_0_4
    SetAttributeAndContext(l_0_2, l_0_22, l_0_23)
    l_0_0 = mp.INFECTED
  end
end
if l_0_0 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
