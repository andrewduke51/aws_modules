output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "databricks_subnet_ids" {
  value = aws_subnet.databricks[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}
