#####################################################################
# pickaxe/api/activate_boost.mcfunction
# written by Eroxen
#
# Applies a speed boost item modifier to the pickaxe in the
# executing player's main hand.
#####################################################################

function instaslate:pickaxe/api/scan_inventory
item modify entity @s weapon.mainhand instaslate:set_tool
advancement revoke @s only instaslate:deactivate_boost
advancement revoke @s only instaslate:activate_boost
tell @s[tag=instaslate.debug] activate