-- Threat: !InfrastructureShared
-- Name: a2b371af41ce
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil and l_0_0.command_line:find(" -c ", 1, true) then
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    local l_0_5 = l_0_4.image_path
    if l_0_5 ~= nil then
      local l_0_6 = {
        ["raystation.exe"] = true,
        ["devenv.exe"] = true,
        ["code.exe"] = true
      }
      local l_0_7 = string.lower(l_0_5:match("\\([^\\]+)$"))
      if l_0_6[l_0_7] then
        return mp.CLEAN
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
