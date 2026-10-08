#####################################################################
# pickaxe/api/deactivate_boost.mcfunction
# written by Eroxen
#
# Runs when the player stops holding a boosted pickaxe,
# or loses the effeciency enchantment or haste effect
# required for the boost to apply.
#####################################################################

function instaslate:pickaxe/api/scan_inventory
advancement revoke @s[predicate=instaslate:boost_valid] only instaslate:deactivate_boost
tell @s[tag=instaslate.debug] deactivate