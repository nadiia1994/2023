resource "aws_iam_user" "user1" {
  name = "Nadia"
}

resource "aws_iam_user" "user2" {
  name = "Kaizen"
}

resource "aws_iam_user" "user3" {
  name = "Hello"
}

resource "aws_iam_user" "user4" {
  name = "World"
}

resource "aws_iam_group" "group1" {
  name = "DevOps"
}

resource "aws_iam_group" "group2" {
  name = "QA"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
  ]

  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "team1" {
  name = "tf-testing-group-membership1"

  users = [
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
  ]

  group = aws_iam_group.group2.name
}

resource "aws_iam_user" "user5" {
  name = "admin"
}

output user_Nadia {
    value = aws_iam_user.user1
}

output user_Kaizen {
    value = aws_iam_user.user2.unique_id
}