-- Threat: !InfrastructureShared
-- Name: adb39dc5a162
-- Type: 21

function checkChildProcessExist(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_1 == nil or type(l_1_1) ~= "table" then
    return nil
  end
  local l_1_2, l_1_3 = bm.get_process_relationships(l_1_0)
  for l_1_4, l_1_5 in ipairs(l_1_3) do
    if mp.bitand(l_1_5.reason_ex, 1) == 1 then
      local l_1_6 = l_1_5.image_path
      for l_1_7, l_1_8 in ipairs(l_1_1) do
        if string.sub(l_1_6, -string.len(l_1_8)) == l_1_8 then
          return l_1_5.ppid
        end
      end
    end
  end
  return nil
end

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\LogonUI.exe")
local l_0_1 = sysio.GetProcessFromFileName(l_0_0)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].ppid
elseif this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].ppid
elseif this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].ppid
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  "conhost.exe"
}
local l_0_4 = checkChildProcessExist(l_0_2, l_0_3)
if l_0_4 == nil then
  return mp.CLEAN
end
return mp.INFECTED
