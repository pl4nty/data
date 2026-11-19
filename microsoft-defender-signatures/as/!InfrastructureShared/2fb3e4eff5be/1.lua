-- Threat: !InfrastructureShared
-- Name: 2fb3e4eff5be
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > 4096 then
  local l_0_1 = string.match(this_sigattrlog[1].utf8p1, "\\([^\\]+)$")
  if l_0_1 then
    local l_0_2 = string.lower(l_0_1)
    if l_0_2 == "lzma.exe" or l_0_2 == "lzma_exe" or l_0_2 == "atinst.exe" then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
