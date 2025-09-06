-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17eb365867adf\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_0:lower() == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
  local l_0_1 = get_socket_fd_from_dup_event(this_sigattrlog[2])
  local l_0_2 = get_socket_fd_from_dup_event(this_sigattrlog[3])
  if l_0_1 ~= nil and l_0_1 == l_0_2 and l_0_2 == get_socket_fd_from_dup_event(this_sigattrlog[4]) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

