-- Threat: !InfrastructureShared
-- Name: e9d7519d0740
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.GetParentProcInfo()
if r0_0 ~= nil and string.lower(r0_0.image_path):match("([^\\]+)$") == "explorer.exe" then
  local r0_1 = mp.GetScannedPPID()
  local r0_2 = mp.GetProcessCommandLine(r0_1)
  if r0_2 == nil then
    return mp.CLEAN
  end
  local r0_3 = r0_2:lower()
  r0_2 = r0_3
  local r0_4 = r0_2
  r0_3 = r0_4:gsub("%^", "")
  r0_2 = r0_3
  r0_4 = r0_2
  r0_3 = r0_4:gsub("'", "")
  r0_2 = r0_3
  r0_4 = r0_2
  r0_3 = r0_4:gsub("%s+", " ")
  r0_2 = r0_3
  r0_3 = string.find
  r0_4 = r0_2
  r0_3 = r0_3(r0_4, "=powershell ", 1, true)
  if not r0_3
    and not string.find(r0_2, "=echo powershell ", 1, true)
    and not string.find(r0_2, "=curl ", 1, true)
    and not string.find(r0_2, "set%s+%w+=%a*power")
    and not string.find(r0_2, "set%s+%w+=%a*shell")
    and not string.find(r0_2, "set%s+%w+=%a*curl") then
    return mp.CLEAN
  end
  local r0_5 = 0
  local r0_6, r0_7, r0_8 = select, 2, r0_2
  r0_6 = r0_6(r0_7, r0_8:gsub("& call set ", ""))
  r0_5 = r0_5 + r0_6
  r0_6 = select
  r0_7 = 2
  r0_8 = r0_2
  r0_6 = r0_6(r0_7, r0_8:gsub("& set ", ""))
  if r0_5 + r0_6 >= 4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
