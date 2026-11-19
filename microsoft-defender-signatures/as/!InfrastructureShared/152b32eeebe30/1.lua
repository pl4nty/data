-- Threat: !InfrastructureShared
-- Name: 152b32eeebe30
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
l_0_0 = l_0_0:match("imagename:([^;]+)")
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = "\\" .. l_0_0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_1].matched and sigattr_tail[l_0_1].attribute == 16400 then
    local l_0_2 = sigattr_tail[l_0_1].utf8p1
    if l_0_0 ~= nil and l_0_0 ~= "" then
      l_0_2 = string.lower(l_0_2)
      if string.find(l_0_2, l_0_0, 1, true) then
        local l_0_3 = {
          "powershell",
          "rundll32",
          "msiexec",
          "mshta",
          "bitsadmin",
          "curl",
          "conhost",
          "control",
          "regsvr32",
          "wscript",
          "cscript",
          "javaws",
          "wmic",
          "scriptrunner",
          "certutil",
          "winrm",
          "python"
        }
        if contains(l_0_2, l_0_3) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
