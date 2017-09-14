#!/usr/bin/env bats

@test "dotfiles" {
	run dotfiles
	[[ $output =~ "Usage" ]]
}

@test "tat" {
	run tat
	[[ $output =~ "Usage" ]]
}

# @test "json" {
# 	ACTUAL=$(echo '{"x":1}' | json)
# 	EXPECTED=$'{ "x": 1 }'
# 	[ "$ACTUAL" = "$EXPECTED" ]
# }
