{#
	***Begin Custom Options***
	Toggle any of the options in this section between 'false' and 'true' in order to enable/disable them in the template
#}

{# Layout Adjustments #}
{% set print_layout = parameters.print_layout == "true" ? true : false %} {# Improves receipt layout for large display/paper size (A4/Letter/Email) #}
{% set chrome_right_margin_fix = false %}           {# Fixes a potential issue where the right side of receipts are cut off in Chrome #}
{% set firefox_margin_fix = false %}                {# Fixes issue with margins cutting off when printing on a letter printer on a Mac #}
{% set test_code_mode = false %}               		{# testing new code to change colors of certain items #}

{# Sale #}
{% set hide_register_name = false %}                {# Hide the Register Name on Sales #}
{% set hide_employee_name = false %}                {# Hide the Employee Name on Sales #}
{% set hide_shop_vat_number = false %}              {# Hide the Shop VAT Number on Sales #}
{% set hide_shop_registration_number = false %}     {# Hide the Shop Registration Number on Sales #}
{% set hide_customer_vat_number = false %}          {# Hide the Customer VAT Number on Sales #}
{% set hide_customer_registration_number = false %} {# Hide the Customer Registration Number on Sales #}
{% set sale_id_instead_of_ticket_number = false %}  {# Displays the Sale ID instead of the Ticket Number #}
{% set invoice_as_title = false %}                  {# If print_layout is true, "Invoice" will be displayed instead of "Sales Receipt" on A4/Letter/Email formats #}
{% set workorders_as_title = false %}               {# Changes the receipt title to "Work Orders" if there is no Salesline items and 1 or more workorders #}
{% set quote_id_prefix = "" %}                      {# Adds a string of text as a prefix for the Quote ID. Ex: "Q-". To be used when "sale_id_instead_of_ticket_number" is true #}
{% set sale_id_prefix = "" %}                       {# Adds a string of text as a prefix for the Sales ID. Ex: "S-". To be used when "sale_id_instead_of_ticket_number" is true #}
{% set hide_notes_in_sale_receipt = false %}        {# Hide the printed note in the sale receipt, if any #}
{% set hide_notes_in_gift_receipt = true %}        {# Hide the printed note in the gift receipt, if any #}

{# Item Lines #}
{% set per_line_discount = true %}                 {# Displays Discounts & Names on each Sale Line under the item description #}
{% set per_line_subtotal = false %}                 {# Displays Subtotals for each Sale Line (ex: "1 x 5.00") #}
{% set discounted_line_items = true %}             {# Strikes out the original price and displays the discounted price on each Sale Line #}
{% set per_line_employee = false %}                 {# Display Employee for each Sale line #}
{% set show_custom_sku = false %}                   {# Adds SKU column for Custom SKU, if available, on each Sale Line #}
{% set show_manufacturer_sku = false %}             {# Adds SKU column for Manufacturer SKU, if available, on each Sale Line #}
{% set show_msrp = false %}                         {# Adds MSRP column for the items MSRP, if available, on each Sale Line #}

{# Misc. Adjustments #}
{% set show_shop_name_with_logo = false %}          {# Displays the Shop Name under the Shop Logo #}
{% set show_thank_you = true %}                     {# Displays "Thank You <Customer Name>!" above bottom barcode #}
{% set show_transaction_item_count = false %}       {# Gives a total quantity of items sold #}
{% set show_transaction_line_count  = false %}   	{# Gives a total quantity of sale lines #}

{% set show_sale_lines_on_store_copy = false %}     {# Shows Sale Lines on Credit Card Store Copy receipts #}
{% set quote_to_invoice = false %}                  {# Changes Quote wording to Invoice in Sales and in Sale Quotes (does not apply to Work Order Quotes) #}
{% set show_sale_lines_on_gift_receipt = true %}    {# Displays Sale Lines on Gift Receipts #}
{% set show_barcode = true %}                       {# Displays barcode at bottom of receipts #}
{% set show_barcode_sku = false %}                   {# Displays the System ID at the bottom of barcodes #}
{% set show_workorders_barcode = false %}           {# Displays workorders barcode #}
{% set show_workorders_barcode_sku = true %}        {# Displays the System ID at the bottom of workorders barcodes #}
{% set hide_ticket_number_on_quote = true %}       {# Hides the Ticket Number on Quotes #}
{% set hide_quote_id_on_sale = true %}             {# Hides the Quote ID on Sales #}

{# KA CUSTOM Misc. Adjustments #}
{% set hide_receiptInf_on_sale = false %}           {# Hides the Receipt Info on Sales *if* no sales lines #}
{% set show_item_count = true %}           {# Hides the Receipt Info on Sales *if* no sales lines #}

{# Customer Information #}
{% set show_full_customer_address = false %}        {# Displays Customers full address, if available #}
{% set show_customer_name_only = true %}            {# Hides all Customer information except for their name #}
{% set show_customer_notes = false %}               {# Displays Notes entered in the Customers profile #}
{% set company_name_override = false %}             {# Does not display the Customer Name if Company Name is present #}

{# Customer Account #}
{% set show_credit_account_signature = false %}     {# Prints Store Copy with signature line on accounts that use an Account Credit (not Deposit) #}
{% set show_customer_layaways = true %}             {# Displays Customer Layaway information at the bottom of receipts #}
{% set show_customer_specialorders = true %}        {# Displays Customer Special Order information at the bottom of receipts #}
{% set show_customer_workorders = true %}           {# Displays Customer Work Order information at the bottom of receipts #}
{% set show_customer_credit_account = true %}       {# Displays Customer Credit Account information at the bottom of receipts #}

{# Logos #}
{% set logo_width = '225px' %}                      {# Default width is 225px. #}
{% set logo_height = '' %}                          {# Default height is 55px. #}
{% set multi_shop_logos = false %}                  {# Allows multiple logos to be added for separate locations when used with options below #}

{#
	Use the following shop_logo_array to enter all of your locations and the link to the logo image that you have uploaded to the internet.
	Enter your EXACT shop name (Case Sensitive!) in the Quotes after the "name": entry and then enter the URL to your logo after the "logo": entry.
	Be sure to set the multi_shop_logos setting above to true in order to have these logos take effect!
#}

{% set shop_logo_array =
	{
		0:{"name":"Example Shop", "logo_url":"http://logo.url.goes/here.jpg"},
		1:{"name":"", "logo_url":""},
		2:{"name":"", "logo_url":""},
		3:{"name":"", "logo_url":""},
		4:{"name":"", "logo_url":""},
		5:{"name":"", "logo_url":""}
	}
%}

{#
	***End Custom Options***
#}

{% extends parameters.print ? "printbase" : "base" %}
{% block extrastyles %}

@page { margin-top: 30px;  }


body {
	font: normal 9pt 'Helvetica Neue', Helvetica, Arial, sans-serif;
	width: {{parameters.page_width|pageWidthToCss}};
	padding: 1px; You need this to make the printer behave
	/* padding-top:50px; KA tyring to make all pages include padding top */

	{% if chrome_right_margin_fix == true %}
		margin-right: .13in;
	{% endif %}
	{% if firefox_margin_fix == true %}
		margin: 25px;
	{% endif %}
}


.forEmailHeader {
  display:none;font-size:0
}
.gift-card-used td:nth-child(1) {
  padding-right:1%;
}
.store {
	page-break-after: always;
	margin-bottom: 40px;
}

.receipt {
	font: normal 10pt “Helvetica Neue”, Helvetica, Arial, sans-serif;
}

.footerSectionTitleH2 {
	text-transform: uppercase;
	font-size: 10pt;
	margin: .5em 0 0;
	border-bottom:2px dashed darkgreen;
}


thead {
	border-bottom: 2px solid black;
}

table th.Sale-Title {
	border-bottom: 1px solid black;
	text-transform: uppercase;
	font-size: 10pt;
	margin: .5em 0 0;
	font-weight: bold;
}
/* --- START KA CUSTOM STYLES --- */
@media print
{
  table { page-break-after:auto }
  tr    { page-break-inside:avoid; page-break-after:auto }
  td    { page-break-inside:avoid; page-break-after:auto }
  thead { display:table-header-group }
  tfoot { display:table-footer-group }
}
{% if test_code_mode == true %}

span.receiptTicketIdLabel {
	color:red; 
}
.openOrders-LN {
	color:green;  {# Setting up to test code #}
}
{% endif %}

	

/* KA Style class fl first line for Miscellaneous items */
table div.fl::first-line {
  font-weight: bold;
  line-height:1.5em;
}
/* KA Style alternate background color (settings to print background browser based) */

table.sale.lines tr:nth-child(even) {
    background-color: #f2f2f2 !important;
    }

table.lines.layaways tr:nth-child(even) {
    background-color: #f2f2f2 !important;
    }

table.lines.specialorders tr:nth-child(even) {
    background-color: #f2f2f2 !important;
    }
table.lines.workorders tr:nth-child(even) {
    background-color: #f2f2f2 !important;
    }
.test-ka {
	font-weight: bold;
	font-size: 3em;
	color:red;
}

.openOrders {
	text-transform: uppercase;
	font-size: 1.5em;
	margin: 1em 0 2em 0;
	text-align: center;
	font-weight: bold;
	border-bottom-style: double;
	border-top-style: double;
}

.openOrders-LN {
	font-weight: bold;
	font-size: 2em;
	display: block;
	text-align: center;
}

.openOrders-names {
    text-align:center;
}

.visHide {
	opacity:0;
	font-size:0;
}

.lineNote_as_description span {
    margin-left: -3px;
}
/*
.openOrders-name_date {
    margin: -200px 0 150px 0;
}

.openOrders-name_date2 {
    position: absolute;
    top: 60px;
    right: 20px;
}

.openOrders-Header {
    margin-left:-73%;  
}
*/
.page-break_before {
	page-break-before: always;
}

.page-break_after {
	page-break-after: always;
}

.total-remain {
	font-size:1.2em;
	background-color:#eded5f;
	color:darkred;
}
.total-remain0 {
	font-weight: bolder;
	color:darkgreen;
}
::-moz-selection { /* Code for Firefox */
	background-color:#eded5f;
	color:darkred;
	cursor: crosshair;
}

::selection {
	background-color:#eded5f;
	color:darkred;
	cursor: crosshair;
}

.small_italix {
	font-size:smaller;
	font-style: italic;
}

.make_red {
	color:red;
}

footer_if_open_orders {
/* possible email friendly if/else statement 
	display:none;
*/
}

.noteLINE {
    padding:10px;
    text-align: center;
    letter-spacing: .05em;
    }
    
#noteTABLE {
    width:80%; 
    margin-left:auto; 
    margin-right:auto;
    margin-top: 10px;
    margin-bottom: 20px;
  }    
  
hr.noteBLINE {
    margin-left: auto;
    margin-right: auto;
    border-style: solid;
    width: 80%;
    /* height: 2px; */
    opacity: .8;
    color: rgb(253 1 1);
	}  
	
.notesNote	{
	padding-left:1%;
}
/* --- END KA CUSTOM STYLES --- */
h1 {
	margin: .5em 0 0;
	font-size: 12pt;
	text-align: center;
}

p.date, p.copy {
	font-size: 9pt;
	margin: 0;
	text-align: center;
}

p.details {
	font-size: 10pt;
	text-align: left;
}

h2 {
	border-bottom: 1px solid black;
	text-transform: uppercase;
	font-size: 10pt;
	margin: .5em 0 0;
}

.receiptHeader {
	text-align: center;
}

.receiptHeader h3 {
	font-size: 12pt;
	margin: 0;
}

.shipping h4 {
	margin-top: 0;
}

.receiptHeader img {
	margin: 8px 0 4px;
}

.receiptShopContact {
	margin: 0;
}

table {
	margin: 0 0;
	width: 100%;
	border-collapse:collapse;
}

table th { text-align: left; }

table tbody th {
	font-weight: normal;
	text-align: left;
}

table td.amount, table th.amount { text-align: right; }
table td.quantity, table th.quantity { text-align: center; white-space: nowrap;}

th.description {
	width: 100%;
}

td.amount { white-space: nowrap; }

table.totals { text-align: right;}
tbody.totals { border-top: 1px solid black;}
table.lines { border-bottom: 1px solid black;}
table.payments { text-align: right;font-weight: bold;font-size:1.1em;margin-bottom:50px;}
table.spacer { margin-top: 1em; }
table tr.total td { font-weight: bold; }

table td.amount { padding-left: 10px; }
table td.custom_field {
	padding-right: 10px;
	text-align: center;
}
table.sale { border-bottom: .1em solid black; }
table div.line_description {
	text-align: left;
	font-weight: bold;
}

table div.line_note {
	text-align: left;
	padding-left: 10px;
}

table div.line_serial {
	text-align: left;
	font-weight: normal;
	padding-left: 10px;
}

table.workorders div.line_description {
	font-weight: normal;
	padding-left: 10px;
}

table.workorders div.line_note {
	font-weight: normal;
	padding-left: 8px;
}

table.workorders div.line_serial {
	font-weight: normal;
	padding-left: 20px;
}

table.workorders td.workorder div.line_note {
	font-weight: bold;
	padding-left: 0px;
}

p.thankyou {
	margin: 0;
	text-align: center;
}

.note { text-align: center; }


.barcodeContainer {
	margin-top: 15px;
	text-align: center;
}

.workorders .barcodeContainer {
	margin-left: 15px;
	text-align: left;
}

dl {
	overflow: hidden
}

dl dt {
	font-weight: bold;
	width: 80px;
	float: left
}

dl dd {
	border-top: 2px solid black;
	padding-top: 2px;
	margin: 1em 0 0;
	float: left;
	width: 180px
}

dl dd p { margin: 0; }

.strike { text-decoration: line-through;width: 100% }

table .description small {
	font-weight: normal;
	padding-left: 10px;
}

.receiptCompanyNameField,
.receiptCustomerNameField,
.receiptCustomerVatField,
.receiptCustomerCompanyVatField,
.receiptCustomerAddressField,
.receiptPhonesContainer,
.receiptCustomerNoteField {
	display: block;
}

table.payments td.label {
	font-weight: bold;
	text-align: right;
	width: 100%;
}

#receiptTransactionDetails table {
	max-width: 245px;
	margin: 0 auto;
}

#receiptTransactionDetails table td {
	text-align: right;
}

#receiptTransactionDetails table td.top {
	font-weight: bold;
}

#receiptTransactionDetails table td.label {
	padding-right: 20px;
	text-align: left;
}

{% if print_layout %}

@page { padding-top: 50px; }
	/* Receipts only */
	@media (max-width: 299px) {
		.show-on-print {
			display: none;
		}
		.hide-on-print {
			display: block;
		}
	}

	@media (min-width: 480px) {
		/* Emails hacks, don't mind the optimisation */
		table.saletotals {
			Float: right;
			Margin-top: 50px;
			width: 50% !important;
		}

		table.payments {
			width: 100%;
		}

		table.payments {
			Float: left;
			margin-top: 5px;
			width: 50%;
			text-align: left;
		}

		table.payments tr td.amount {
			text-align: right;
			width: auto;
		}

		table.payments tr td.amount {
			text-align: left;
			width: 100%;
		}


		table.payments td.label {
			font-weight: bold;
			text-align: left;
			white-space: nowrap;
			width: inherit;
		}
	}

/* Email, Letter, A4 only */
	@media (min-width: 300px) {
		.show-on-print {
			display: block;
		}
		.hide-on-print {
			display: none;
		}

		body {
			padding: 0px; /* ka testing from orginal 15px  */
			position: relative;
		}

		.receiptHeader {
			Float: left;
			position: relative;
			max-width: 50%;
			text-align: left;
		}

		.receiptHeader img {
			display: block;
			margin: 0 0 10px;
			max-width: 120px;
		}

		.receiptHeader h3.receiptShopName {
			font-size: 14pt;
			margin-bottom: 3px;
			text-decoration: underline;
		}

		.receiptShopName,
		.receiptShopContact {
			text-align: left;
		}

		.receiptTypeTitle,
		.receiptTypeTitle span {
			font-size: 18pt;
			Float: right;
			clear: right;
			text-align: center;
			margin-top: 0;
		}

		.receiptTypeTitle span.hide-on-print {
			font-size: 0;
			display: none;
		}

		p.date,
		p.copy {
			Float: right;
			clear: right;
		}

		#receiptInfo {
		{% if hide_receiptInf_on_sale == 'true' %}
			display: none;
		{% else %}
			clear: both;
			padding-top: 15px;
			padding-left: 0px;
		{% endif %}
		}

		#receiptInfo:after {
			content: "";
			display: table;
			clear: both;
		}

		.receiptQuoteIdField,
		.receiptTicketIdField {
			clear: right;
			Float: right;
		}
		.receiptQuoteIdLabel,
		.receiptTicketIdLabel {
			display: none !important;
		}
		#receiptQuoteId,
		#receiptTicketId {
			font-size: 14pt;
			font-weight: bold;
			display: block;
			Float: right;
		}

		.vatNumberField,
		.companyRegistrationNumberField,
		.receiptRegisterNameField,
		.receiptEmployeeNameField {
			clear: right;
			Float: right;
			text-align: right;
		}
		.vatNumberField span,
		.companyRegistrationNumberField span,
		.receiptRegisterNameField span,
		.receiptEmployeeNameField span {
			font-size: 8pt;
		}

		.receiptCustomerAddressLabel,
		.receiptEmailLabel {
			display: none !important;
		}

		.receiptCompanyNameField,
		.receiptCustomerNameField,
		.receiptCustomerVatField,
		.receiptCustomerCompanyVatField {
			margin-bottom: 3px;
			margin-top: 3px;
		}

		.receiptCompanyNameLabel,
		.receiptCustomerNameLabel,
		.receiptCustomerVatLabel,
		.receiptCustomerCompanyVatLabel {
			font-size: 11pt;
			font-weight: bold;
		}
		#receiptCompanyName,
		#receiptCustomerName {
			font-size: 12pt;
		}

		.receiptCompanyNameField,
		.receiptCustomerNameField,
		.receiptCustomerVatField,
		.receiptCustomerCompanyVatField,
		.receiptCustomerAddressField,
		.receiptPhonesContainer,
		.receiptCustomerNoteField {
			display: block;
			max-width: 40%;
		}

		table.sale {
			clear: both;
			padding-top: 30px;
		}

		table.sale tbody tr:first-child th,
		table.sale tbody tr:first-child td {
			padding-top: 10px;
		}
		table.sale tbody tr:last-child th,
		table.sale tbody tr:last-child td {
			padding-bottom: 10px;
		}
		table.sale tbody th,
		table.sale tbody td {
			padding-bottom: 5px;
			padding-top: 5px;
		}

		.paymentTitle,
		.notesTitle,
		.footerSectionTitle {
			font-size: 12pt;
			padding-top: 15px;
			text-transform: none;
		}
		.footerSectionTitle {
			clear: both;
		}
.footerSectionTitleH2 {
text-transform: uppercase;
font-size: 10pt;
margin: .5em 0 0;
}
		.notesTitle {
			float: left;
			width: 100%;
			color:red;
		}

		.thankyou {
			clear: both;
			padding-top: 30px;
		}

		img.barcode {
			border: none;
			height: 30px;
			width: 150px;
		}

	}

{% endif %}

{% endblock extrastyles %}

{% block content %}
	{% set page_loaded = false %}
	{% for Sale in Sales %}
		{% if not parameters.page or parameters.page == 1 %}
			{% if Sale.Shop.ReceiptSetup.creditcardAgree|strlen > 0 and not parameters.gift_receipt and not parameters.email %}
				{% for SalePayment in Sale.SalePayments.SalePayment %}
					{% if parameters.force_cc_agree or parameters.print_workorder_agree %}
						{{ _self.store_receipt(Sale,parameters,_context,SalePayment) }}
						{% set page_loaded = true %}
					{% else %}
						{% if SalePayment.archived == 'false' and SalePayment.MetaData.ReceiptData.requires_receipt_signature|CompBool == true %}
							{{ _self.store_receipt(Sale,parameters,_context,SalePayment) }}
							{% set page_loaded = true %}
						{% endif %}
					{% endif %}
				{% endfor %}
			{% endif %}
		{% endif %}

				{% if not parameters.page or parameters.page == 2 or not page_loaded %}
		{# this is for any item with tags that match list of exclusions #}		    

		{% set criticalTags = [
				{"tag": 'service'},
				{"tag": 'exclude-star'},
			]
		%}
		{% set exclude_ifTag = 'false' %}
		{% set exclude_ifTag_count = 0 %}
		{% for Line in Sale.SaleLines.SaleLine %}
			{% for tag in criticalTags %}
				{% if tag.tag in Line.Item.Tags.tag %}
				    {% set exclude_ifTag_count = exclude_ifTag_count + 1 %}
					{% set exclude_ifTag = 'true' %}
				{% endif %}
			{% endfor %}		
		{%endfor%}	
{# open order counts #}
		{% set openOrderCount = 0 %}
		{% set soCount = 0 %}{% set layCount = 0 %}{% set woCount = 0 %}
		{% if Sale.Customer.SpecialOrders %} {% set soCount = 1 %}{% endif %}
		{% if Sale.Customer.WorkOrders %} {% set layCount = 1 %}{% endif %}
		{% if Sale.Customer.Layaways %} {% set woCount = 1 %}{% endif %}
		{% set openOrderCount = (soCount + layCount +  woCount) %}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Open Orders: {{openOrderCount}}</p>	#}	
			<!-- replace.email_custom_header_msg -->
					
		{# KA - Used for Debugging Purposes   <p style="display:none;font-size:0;">Lines Contain Tags That Should Be Excluded: {{exclude_ifTag_count}}</p>#}

<p class="forEmailHeader">{% if openOrderCount > 0 %}{{ Sale.Shop.name }} Receipt & Open Order Statement {% else %}{{ Sale.Shop.name }}  Receipt {% endif %}for {{ Sale.Customer.firstName }} {{ Sale.Customer.lastName }}<br><br></p>
				
				<!-- exclude this -->


	{% set has_non_taxed_items = 'false' %}
	{% set has_non_taxed_items_count = 0 %}
	{% for Line in Sale %}
	{% if Line.Item %}

			{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) or
				(Line.Note.note == 'Labor') %}
				{% set has_non_taxed_items_count = has_non_taxed_items_count + 1 %}
				{% set has_non_taxed_items = 'true' %}
			{% endif %}
		{% endif %}
	{% endfor %}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Non-Taxed Items on Order Count: {{has_non_taxed_items_count}}</p><!-- total count non-taxed items -->#}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Non-Taxed Items on Order: {{has_non_taxed_items}}</p><!-- non-taxed items True/False-->#}

{# this is for any item in order that is non-taxed or labor #}	

{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Non-Taxed Items on Order: {{ _self.no_tax_applied_to_order(Sale) }}</p><!-- non-taxed items True/False-->#}
			
			 	
			{# this is for any item was an open order line #}		    
		{% set was_open_item = 'false' %}
		{% set was_open_item_count = 0 %}
    	{% for Line in Sale.SaleLines.SaleLine %}
			{% if Line.isWorkorder == 'true' or Line.isSpecialOrder == 'true' or Line.isLayaway == 'true' %}
			{% set was_open_item_count = was_open_item_count + 1 %}
				{% set was_open_item = 'true' %}
			{% endif %}
		{% endfor %}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Line Items From Open Orders: {{was_open_item_count}}#}

		
				
				{# Custom Item Count Loop #}
			{% if show_item_count %}
					{% set transaction_item_count = 0 %}
					{% for Line in Sale.SaleLines.SaleLine %}
						{% set transaction_item_count = transaction_item_count + Line.unitQuantity %}
					{% endfor %}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Line Item Count: {{ transaction_item_count }}</p>#}
				{% endif %}
				
					{# Item Count Loop based on sale line not item counts #}
				{% if show_item_count %}
					{% set transaction_line_count = 0 %}
					{% for Line in Sale.SaleLines.SaleLine %}
						{% set transaction_line_count = transaction_line_count + 1 %}
					{% endfor %}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">Total Line Count: {{ transaction_line_count }}</p>#}
				{% endif %}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;color:red;">Open Orders NON-Taxed Item Count: 
				{{ _self.no_tax_applied_text_open_orders_count(Sale) }}</p>#}
		
		{% set noshow_star_note = 'true' %}		
		{% if subtract(transaction_line_count, exclude_ifTag_count) > exclude_ifTag_count %}
		{% set noshow_star_note = 'false' %}
		{% endif %}		

{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">lines left: {{subtract(transaction_line_count, exclude_ifTag_count)}}</p>#}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">no show star note?: {{noshow_star_note}}</p>#}
{# KA - Used for Debugging Purposes  <p style="display:none;font-size:0;">final count:  {{(subtract(transaction_line_count, exclude_ifTag_count)) - (exclude_ifTag_count) }}</p>#}
						
			<div>
				{{ _self.ship_to(Sale,_context) }}

{% if transaction_line_count == 0 and not Sale.SalePayments.SalePayment %}
{% else %}
				{{ _self.header(Sale,_context) }}
				{{ _self.title(Sale,parameters,_context) }}
				{{ _self.date(Sale) }}
				{{ _self.sale_details(Sale,_context) }}
{% endif %}
				{% if not parameters.gift_receipt or show_sale_lines_on_gift_receipt %}
					{{ _self.receipt(Sale,parameters,false,_context) }}
				{% endif %}

				{# Item Count Loop #}
				{% if show_transaction_item_count %}
					{% set transaction_item_count = 0 %}
					{% for Line in Sale.SaleLines.SaleLine %}
						{% set transaction_item_count = transaction_item_count + Line.unitQuantity %}
					{% endfor %}
{# KA - Used for Debugging Purposes  <p>Total Item Count: {{ transaction_item_count }}</p> #}
				{% endif %}

		{# Item Count Loop based on sale line not item counts #}
				{% if show_transaction_line_count %}
					{% set transaction_line_count = 0 %}
					{% for Line in Sale.SaleLines.SaleLine %}
						{% set transaction_line_count = transaction_line_count + 1 %}
					{% endfor %} 
{# KA - Used for Debugging Purposes  <p>Total Line Count: {{ transaction_line_count }}</p> #}
				{% endif %}
		
{# This line is used for a content header on emailed receipts #}


          			
				
{% if Sale.quoteID and Sale.Quote.notes|strlen > 0 %}
    <p id="receiptQuoteNote" class="note quote">{{ Sale.Quote.notes|noteformat|raw }}</p>
{% endif %}
{# removed this bit #}
{% if Sale.quoteID != 0 and Sale.completed == 'false' %}
{% elseif transaction_line_count == 0 and not Sale.SalePayments.SalePayment and Sale.Customer.MetaData.subtotal > 0 %}
    <div class="footerOpenOnly" {# style="color:red;" #}>

		<div>{{ _self.no_tax_applied_text_open_orders(Sale) }}</div>
        <p style="padding-top:30px;padding-bottom:10px;" id="receiptThankYouNote" class="thankyou">Thank You
        {% if Sale.Customer %}
        	{{ Sale.Customer.firstName }}
            {{ Sale.Customer.lastName }}
        {% endif %}!
        </p>

	</div>
	{% elseif (Sale.SalePayments or Sale.calcSubtotal > 0 or transaction_line_count > 0) and Sale.Customer.MetaData.subtotal > 0 %}
	    <div class="footerSale-Open" {# style="color:red;" #}>
        <p
            style="padding-top:30px;padding-bottom:10px;"
            id="receiptThankYouNote"
            class="thankyou">Thank You{% if Sale.Customer %}
                {{ Sale.Customer.firstName }}
                {{ Sale.Customer.lastName }}
            {% endif %}!
        </p>
	{% if noshow_star_note == 'false' %}
		<div>{{ _self.no_tax_applied_star(Sale) }}</div>
	{% endif %}
    {% if transaction_line_count != 0 %}
    <div>{{ _self.from_open_order(Sale) }}</div>
    {% endif %}
	</div>
{% else %}
    <div class="standardFooter">
	{% if noshow_star_note == 'false' %}
		<div>{{ _self.no_tax_applied_star(Sale) }}</div>
	{% endif %}
    {% if transaction_line_count != 0 %}
    <div>{{ _self.from_open_order(Sale) }}</div>
    {% endif %}
        <p id="receiptNote" class="note">
            {{ Sale.Shop.ReceiptSetup.generalMsg|noteformat|raw }}
        </p>
        <p id="receiptThankYouNote" class="thankyou">Thank You{% if Sale.Customer %}
                {{ Sale.Customer.firstName }}
                {{ Sale.Customer.lastName }}
            {% endif %}!</p>
        <p class="barcodeContainer"><img id="barcodeImage" height="50" width="250" class="barcode" src="/barcode.php?type=receipt&amp;number={{ Sale.ticketNumber }}&amp;hide_text={{ not show_barcode_sku }}"></p>
        </div>
    {% endif %}
</div>
			
{% if Sale.TaxCategory.taxCategoryID == 10 %}
<div class="taxExempt"><h1 style="text-align:center;">*{{Sale.TaxCategory.tax1Name}}*</h1>
<p style="text-align:center;">Attach a photocopy of customers Tax Exemption ID card to this receipt.</p></div>
{% endif %}
			<!-- replace.email_custom_footer_msg -->
		{% endif %}
	{% endfor %}
{% endblock content %}

{% macro no_tax_applied_star(Sale) %}
	{% set has_non_taxed_items = 'false' %}
	{% for Line in Sale.SaleLines.SaleLine %}
		{# If line has no tax and is not a workorder line, unless it is the workorders Labor line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) or
			(Line.Note.note == 'Labor') %}
			{% set has_non_taxed_items = 'true' %}
		{% endif %}
	{% endfor %}
	{% if has_non_taxed_items == 'true' %}
		<p id="noTaxApplied" class="thankyou"><span class="make_red">*</span><span class="small_italix">{{ mostranslate('Item(s) With No Tax Applied') }}</span></p>
	{% endif %}
{% endmacro %}

{% macro no_tax_applied_to_order(Line,options) %}
	{% set no_tax_applied_to_order = 'false' %}
	{% if Line.Item %}
		{# If line has no tax and is not a workorder line, unless it is the workorders Labor line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) or
			(Line.Note.note == 'Labor') %}
			{% set no_tax_applied_to_order = 'true' %}
		{% endif %}
	{% endif %}
{{ no_tax_applied_to_order }}
{% endmacro %}

{% macro no_tax_applied_text_open_orders(Sale) %}
    {% set has_non_taxed_item = 'false' %}
     {% set has_non_taxed_item_count = 0 %}
	{% for Line in Sale.Customer.Layaways.SaleLine %}
	{# If line has no tax and is a Layaway Order line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set has_non_taxed_item = 'true' %}
			{% set has_non_taxed_item_count = has_non_taxed_item_count + 1 %}
		{% endif %}
	{% endfor %}
		{% for Line in Sale.Customer.SpecialOrders.SaleLine %}
	{# If line has no tax and is a Special Order line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set has_non_taxed_item = 'true' %}
			{% set has_non_taxed_item_count = has_non_taxed_item_count + 1 %}
		{% endif %}
	{% endfor %}
		{% for Line in Sale.Customer.Workorders.SaleLine %}
	{# If line has no tax and is a Work Order line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set has_non_taxed_item = 'true' %}
			{% set has_non_taxed_item_count = has_non_taxed_item_count + 1 %}
		{% endif %}
	{% endfor %}
		{% if has_non_taxed_item == 'true' and has_non_taxed_item_count > 0 %}
		<p id="noTaxApplied" class="thankyou"><span class="make_red">* </span><span class="small_italix">{{ mostranslate('Item(s) With No Tax Applied') }}</span> <span style="display:none;font-size:0;">{{has_non_taxed_item}} : {{has_non_taxed_item_count}}<span></p>{% else %}
	{% endif %}
{% endmacro %}

{% macro no_tax_applied_text_open_orders_count(Sale) %}
    {% set has_non_taxed_item = 'false' %}
     {% set has_non_taxed_item_count = 0 %}
	{% for Line in Sale.Customer.Layaways.SaleLine %}
	{# If line has no tax and is a Layaway Order line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set has_non_taxed_item = 'true' %}
			{% set has_non_taxed_item_count = has_non_taxed_item_count + 1 %}
		{% endif %}
	{% endfor %}
		{% for Line in Sale.Customer.SpecialOrders.SaleLine %}
	{# If line has no tax and is a Special Order line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set has_non_taxed_item = 'true' %}
			{% set has_non_taxed_item_count = has_non_taxed_item_count + 1 %}
		{% endif %}
	{% endfor %}
		{% for Line in Sale.Customer.Workorders.SaleLine %}
	{# If line has no tax and is a Work Order line #}
		{% if Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set has_non_taxed_item = 'true' %}
			{% set has_non_taxed_item_count = has_non_taxed_item_count + 1 %}
		{% endif %}
	{% endfor %}
{{has_non_taxed_item_count}}
{% endmacro %}

{% macro from_open_order(Sale) %}
    {% set was_open_item = 'false' %}
    	{% for Line in Sale.SaleLines.SaleLine %}
	{# this is for any item was an open order line #}
		{% if Line.isWorkorder == 'true' or Line.isSpecialOrder == 'true' or Line.isLayaway == 'true' %}
			{% set was_open_item = 'true' %}
		{% endif %}
	{% endfor %}
	{% if was_open_item == 'true' %}
		<p id="noTaxApplied" class="thankyou"><span class="make_red">^ </span><span class="small_italix">{{ mostranslate('Item(s) From Open Orders') }}</span></p>{% else %}
	{% endif %}
{% endmacro %}

{% macro from_open_order_carrot(Sale) %}
    {% set was_open_item = 'false' %}
    	{% for Line in Sale.SaleLines.SaleLine %}
	{# this is for any item was an open order line #}
		{% if Line.isWorkorder == 'true' or Line.isSpecialOrder == 'true' or Line.isLayaway == 'true' %}
			{% set was_open_item = 'true' %}
		{% endif %}
	{% endfor %}
	{% if was_open_item == 'true' %}
		<span class="make_red">^ </span>
	{% else %}
	<span class="make_red">!! </span>
	{% endif %}
{% endmacro %}

{% macro linesDescription(Line,options) %}

	{% set no_tax_applied_2_order3 = 'false' %}
	{% if Line.Item or Line.Note %}
		{% if ('Note:' in Line.Item.description) %}{% set no_tax_applied_2_order3 = 'false' %}{% elseif Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set no_tax_applied_2_order3 = 'true' %}
		{% endif %}
	{% endif %}
			{{ no_tax_applied_2_order3 }}
{% endmacro %}

{% macro lineDescription_star2(Sale) %}
	{% set no_tax_applied_2_order2 = 'false' %}
	{% if Line.Item or Line.Note %}
		{% if ('Note:' in Line.Item.description) or exclude_ifTag == 'true' %}{% set no_tax_applied_2_order2 = 'false' %}{% elseif Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}
			{% set no_tax_applied_2_order2 = 'true' %}
		{% endif %}
	{% endif %}
	{{no_tax_applied_2_order2}}
{% endmacro %}

{% macro store_receipt(Sale,parameters,options,Payment) %}
	<div class="store">
        {{ _self.header(Sale,_context) }}
		{{ _self.title(Sale,parameters,options) }}
			<p class="copy">Store Copy</p>
		{{ _self.date(Sale) }}
		{{ _self.sale_details(Sale,options) }}

		{% if options.show_sale_lines_on_store_copy %}
			{{ _self.receipt(Sale,parameters,true,options) }}
		{% else %}
            {% if isUnifiedReceipt(Sale.SalePayments) %}
                {{ _self.single_transaction_details(Sale, Payment) }}
            {% else %}
                <table class="payments">
                									<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">Payments</th></tr>
  </thead><tbody>
                    {{ _self.cc_payment_info(Sale,Payment) }}
              </tbody>  </table>
            {% endif %}
		{% endif %}

		{% if Sale.quoteID and Sale.Quote.notes|strlen > 0 %}<p class="note quote">{{Sale.Quote.notes|noteformat|raw}}</p>{% endif %}

		{{ _self.cc_agreement(Sale,Payment,options) }}
		{{ _self.shop_workorder_agreement(Sale) }}

		<img height="50" width="250" class="barcode" src="/barcode.php?type=receipt&number={{Sale.ticketNumber}}">

		{{ _self.ship_to(Sale,options) }}
	</div>
{% endmacro %}

{% macro lineDescription(Line,options) %}
	{% set criticalTags = [
		{"tag": 'service'},
		{"tag": 'magazine'},
		{"tag": 'magazines'},
	]
	%}
	{% set exclude_ifTag = 'false' %}
	{% for tag in criticalTags %}
		{% if tag.tag in Line.Item.Tags.tag %}
			{% set exclude_ifTag = 'true' %}
		{% endif %}
	{%endfor%}
	{% if Line.Item %}
		<div class='line_description'>
			{% autoescape true %}{{ Line.Item.description|nl2br }}{% if ('Note:' in Line.Item.description) or exclude_ifTag == 'true' %}{% elseif Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0) %}<span style="color:red;">* </span>{% endif %}{% if ('Note:' in Line.Item.description) and ( not Sale.SaleLines) %}{% elseif (Line.isWorkorder == 'true' or Line.isSpecialOrder == 'true' or Line.isLayaway == 'true') %}<span style="color:red;">^ </span>{% endif %}{% endautoescape %}<span class="visHide">{% if exclude_ifTag == 'true' %}DENIED{% else %}
{% for key, value in Line.Item.Tags.tag %}
{{key}} - {{value}}
{%endfor%}
{% endif %}
{#
{% for tag in criticalTags %}
*{{tag.tag}}*
{%endfor%}		

{% for tag in criticalTags %}
{% if tag.tag in Line.Item.Tags.tag %}
SHIT
{% endif %}
{%endfor%}




{% if criticalTags in Line.Item.Tags.tag %}
SHIT
{% else %}
{% for key, value in Line.Item.Tags.tag %}
{{key}} - {{value}}
{%endfor%}
{% endif %}


{% for value in Line.Item.Tags.tag %}
{% set tagVar = value %}
{% if tagVar in criticalTags %}
2nd-SHIT
{% else %}
2nd-{{key}} - {{value}}
{% endif %}
{%endfor%}
#}


			{# - {% for tags in Line.Item.Tags.tag %} 
			{{ tags|raw }}
		{% if 'backing' in tagging %}-NOOO-{% else %}{{Line.Item.Tags.tag}}{% endif %}
		{% endfor %}#}
		</span>
		</div>
	{% endif %}
	{% if Line.Note %}
	{% set someNote = Line.Note.note|split(' ') %}
		<div class="{% if not Line.Item %}line_description{% else %}line_note{% endif %}">
		{% autoescape true %}
		{% if 'Miscellaneous' in someNote or (not Line.Item) %}
			<div class="fl">
				<div class="lineNote_as_description">{{Line.Note.note}}
			{% if (Line.tax == 'false' or (Line.calcTax1 == 0 and Line.calcTax2 == 0)) and (Line.isWorkorder == 'false' or Line.Note.note == 'Labor') and (exclude_ifTag == 'false') %}<span style="color:red;">* </span>
			{% endif %}
			{% if 'Note:' in Line.Item.description %}
			{% elseif (Line.isWorkorder == 'true' or Line.isSpecialOrder == 'true' or Line.isLayaway == 'true') and (exclude_ifTag == 'false') %}<span style="color:red;">^</span>
			{% endif %}
			</div>
		{% else %}
				<span class="lineNote_as_note">{{ Line.Note.note|noteformat|raw }}</span>
		{% endif %}
				<!-- If line has no tax and is not a workorder line, unless it is the workorder's "Labor" line -->
		{% endautoescape %}
			</div>
		</div>
	{% endif %}
	{% if Line.Serialized %}
		{% for Serialized in Line.Serialized.Serialized %}
			<div class='line_serial'>
				Serial#: {{ Serialized.serial }} {{ Serialized.color }} {{ Serialized.size }}
			</div>
		{% endfor %}
	{% endif %}
	{% if options.per_line_employee %}
		<div class='line_note'>
			Employee: {{ Line.Employee.firstName }}
		</div>
	{% endif %}
{% endmacro %}

{% macro title(Sale,parameters,options) %}
	<h1 class="receiptTypeTitle">
		{% if Sale.calcTotal >= 0 %}
			{% if Sale.completed == 'true' %}
				{% if options.invoice_as_title and options.print_layout %}
					<span class="hide-on-print">
				{% endif %}
				{% if options.workorders_as_title and Sale.SaleLines is empty and Sale.Customer.Workorders is defined %}
					 Work Orders
				{% else %}
					{% if parameters.gift_receipt %}Gift{% else %}Sales{% endif %} Receipt
				{% endif %}
				{% if options.invoice_as_title and options.print_layout %}
					</span>
					<span class="show-on-print">
						{% if options.workorders_as_title and Sale.SaleLines is empty and Sale.Customer.Workorders is defined %}
							Work Orders
						{% else %}
							Invoice
						{% endif %}
					</span>
				{% endif %}
			{% elseif Sale.voided == 'true' %}
				{% if options.invoice_as_title and options.print_layout %}
					<span class="hide-on-print">
				{% endif %}
					Receipt <large>VOIDED</large>
				{% if options.invoice_as_title and options.print_layout %}
					</span>
					<span class="show-on-print">Invoice VOIDED</span>
				{% endif %}
			{% else %}
				{% if options.quote_to_invoice %}
					Invoice
				{% else %}
					Quote
				{% endif %}
				{% if not Sale.quoteID %}
					<large>(NOT A RECEIPT)</large>
				{% endif %}
			{% endif %}
		{% else %}
			{% if options.invoice_as_title and options.print_layout %}
				<span class="hide-on-print">
			{% endif %}
			Refund Receipt
			{% if options.invoice_as_title and options.print_layout %}
				</span>
				<span class="show-on-print">Refund Invoice</span>
			{% endif %}
		{% endif %}
	</h1>
{% endmacro %}

{% macro date(Sale) %}
	<p class="date" id="receiptDateTime">
		{% if Sale.timeStamp %}
            {{Sale.timeStamp|correcttimezone|date(getDateTimeFormat())}}
		{% else %}
			{{"now"|date(getDateTimeFormat())}}
		{% endif %}
	</p>
{% endmacro %}

{# ka macro for open orders // if there is an open order then use the date of the issued open order instead of the "sale" or "today's" date #}

{% macro dateOpenOrder(Sale) %}
	{% if Sale.Customer.MetaData.subtotal > 0 %}
		{% if Sale.Customer.SpecialOrders.SaleLine %}	<div class="receiptTimeStamp" style="text-align:center;">'Special Order' Created: {{Sale.Customer.SpecialOrders.SaleLine.createTime|correcttimezone|date(getDateTimeFormat())}}</div>{% else %}{% endif %}
		{% if Sale.Customer.Layaways.SaleLine %}	<div class="receiptTimeStamp" style="text-align:center;">Item(s) Set Aside: {{Sale.Customer.Layaways.SaleLine.createTime|correcttimezone|date(getDateTimeFormat())}}</div>{% else %}{% endif %}
		{% if Sale.Customer.WorkOrders.SaleLine %}	<div class="receiptTimeStamp" style="text-align:center;">'Work Order' Created: {{Sale.Customer.WorkOrders.SaleLine.createTime|correcttimezone|date(getDateTimeFormat())}}</div>{% else %}{% endif %}	
	{% elseif Sale.timeStamp %}
		<div class="receiptTimeStamp" style="text-align:center;">{{Sale.timeStamp|correcttimezone|date(getDateTimeFormat())}}</div>
	{% else %}
		<div class="receiptTimeStamp" style="text-align:center;">{{"now"|date(getDateTimeFormat())}}</div>
	{% endif %}
{% endmacro %}

{% macro sale_details(Sale,options) %}
	<p id="receiptInfo" class="details">
		{% if options.hide_quote_id_on_sale and Sale.completed == 'true' %}
		{% else %}
			{% if Sale.quoteID > 0 %}
				<span class="receiptQuoteIdField">
					<span class="receiptQuoteIdLabel">
						{% if options.quote_to_invoice %}
							Invoice #:
						{% else %}
							Quote #:
						{% endif %}
					</span>
					<span id="receiptQuoteId">{{options.quote_id_prefix}}{{Sale.quoteID}}</span>
					<br />
				</span>
			{% endif %}
		{% endif %}

		{% if options.hide_ticket_number_on_quote and Sale.completed != 'true' and Sale.quoteID > 0 %}
		{% else %}
			<span class="receiptTicketIdField">
				<span class="receiptTicketIdLabel">
					{% if options.sale_id_instead_of_ticket_number %}Sale: {% else %}Ticket: {% endif %}</span>
				<span id="receiptTicketId">
					{% if options.sale_id_instead_of_ticket_number %}
						{{options.sale_id_prefix}}{{Sale.saleID}}
					{% else %}
						{{Sale.ticketNumber}}
					{% endif %}
				</span>
				<br />
			</span>
		{% endif %}

		{% if isVATAndRegistrationNumberOnReceipt() %}
			{% if Sale.Shop.vatNumber|strlen and not options.hide_shop_vat_number %}
				<span class="vatNumberField">
					<span class="vatNumberLabel">VAT #: </span>
					<span id="vatNumber">{{Sale.Shop.vatNumber}}</span>
					<br />
				</span>
			{% endif %}
			{% if Sale.Shop.companyRegistrationNumber|strlen and not options.hide_shop_registration_number %}
				<span class="companyRegistrationNumberField">
					<span class="companyRegistrationNumberLabel">Company registration #: </span>
					<span id="companyRegistrationNumber">{{Sale.Shop.companyRegistrationNumber}}</span>
					<br />
				</span>
			{% endif %}
		{% endif %}

		{% if Sale.Register and not options.hide_register_name %}
			<span class="receiptRegisterNameField"><span class="receiptRegisterNameLabel">Register: </span><span id="receiptRegisterName">{{Sale.Register.name}}</span><br /></span>
		{% endif %}

		{% if Sale.Employee and not options.hide_employee_name %}
			<span class="receiptEmployeeNameField"><span class="receiptEmployeeNameLabel">Employee: </span><span id="receiptEmployeeName">{{Sale.Employee.firstName}}</span><br /></span>
		{% endif %}

		{% if Sale.Customer %}
			{% if Sale.Customer.company|strlen > 0 %}
				<span class="receiptCompanyNameField"><span class="receiptCompanyNameLabel">Company: </span><span id="receiptCompanyName">{{Sale.Customer.company}}</span><br /></span>
			{% endif %}

			{% if not options.company_name_override or not Sale.Customer.company|strlen > 0 %}
				<span class="receiptCustomerNameField"><span class="receiptCustomerNameLabel">Customer: </span><span id="receiptCustomerName">{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}</span><br /></span>
			{% endif %}

			{% if not options.show_customer_name_only %}
				{% if options.show_full_customer_address %}
					<span class="receiptCustomerAddressField">
						<span class="receiptCustomerAddressLabel">Address:</span>
						{{ _self.address(Sale.Customer.Contact,',',options) }}
					</span>
				{% endif %}

				<span id="receiptPhonesContainer" class="indent">
					{% for Phone in Sale.Customer.Contact.Phones.ContactPhone %}
						<span data-automation="receiptPhoneNumber">{{Phone.useType}}: {{Phone.number}}</span><br />
					{% endfor %}

					{% for Email in Sale.Customer.Contact.Emails.ContactEmail %}
						<span class="receiptEmailLabel">Email: </span><span id="receiptEmail">{{Email.address}} ({{Email.useType}})</span><br />
					{% endfor %}
				</span>
			{% endif %}

			{% if isVATAndRegistrationNumberOnReceipt() %}
				{% if Sale.Customer.vatNumber|strlen and not options.hide_customer_vat_number %}
					<span class="receiptCustomerVatField">
						<span class="receiptCustomerVatLabel">Customer VAT #: </span>
						<span id="customerVatNumber">{{Sale.Customer.vatNumber}}</span>
						<br />
					</span>
				{% endif %}

				{% if Sale.Customer.companyRegistrationNumber|strlen and not options.hide_customer_registration_number %}
					<span class="receiptCustomerCompanyVatField">
						<span class="receiptCustomerCompanyVatLabel">Customer company registration #: </span>
						<span id="customerCompanyVatNumber">{{Sale.Customer.companyRegistrationNumber}}</span>
						<br />
					</span>
				{% endif %}
			{% endif %}

			{% if options.show_customer_notes %}
				{% if Sale.Customer.Note.note|strlen > 0 %}
					<span class="receiptCustomerNoteField"><span class="receiptCustomerNoteLabel">Note: </span>{{ Sale.Customer.Note.note|noteformat|raw }}<br /></span>
				{% endif %}
			{% endif %}
		{% endif %}
	</p>
{% endmacro %}

{% macro line(isTaxInclusive,Line,parameters,options) %}
	<tr>
		<th data-automation="lineItemDescription" class="description">
		{{ _self.lineDescription(Line,options) }}
		{% if options.per_line_discount == true and not parameters.gift_receipt %}
			{% if Line.calcLineDiscount > 0 %}
			<small>Discount: '{{ Line.Discount.name }}' -{{Line.calcLineDiscount|money}}</small>
			{% elseif Line.calcLineDiscount < 0 %}
			<small class="show-on-print">{{ Line.Discount.name }} (Savings = {{Line.calcLineDiscount|getinverse|money}})</small>
			{% endif %}
		{% endif %}
		</th>

		{% if options.show_custom_sku and Line.Item.customSku %}
			<td class="custom_field">{{ Line.Item.customSku }}</td>
		{% endif %}
		{% if options.show_manufacturer_sku and Line.Item.manufacturerSku %}
			<td class="custom_field">{{ Line.Item.manufacturerSku }}</td>
		{% endif %}

		{% if options.show_msrp == true and not parameters.gift_receipt %}
		{% set msrp_printed = false %}
			{% for price in Line.Item.Prices.ItemPrice if not msrp_printed %}
				{% if price.useType == "MSRP" and price.amount != "0"%}
				<td class="custom_field">{{ price.amount|money }}</td>
		{% set msrp_printed = true %}
				{% endif %}
			{% endfor %}
		{% if not msrp_printed %}
			<td class="custom_field" style="color:white;">N/A</td>
		{% endif %}
		{% endif %} 
{# don't show qty or amount if the item is 0 dollars and not a discounted item #}
			{% set dontShow = false %}
			{% if (Line.unitQuantity != 0) and (Line.displayableSubtotal == 0) and (Line.discountAmount == 0) and (Line.Item.Prices.ItemPrice.amount == 0) %}	
				{% set dontShow = true %}
			{% endif %}
			
		<td data-automation="lineItemQuantity" class="quantity">
		{# just checking test #}
			{% if Line.unitQuantity > 1 %}
				{% if Line.discountAmount != 0 and (Line.Item.Prices.ItemPrice.amount|money != divide(Line.displayableSubtotal, Line.unitQuantity)|money) %}
				{{Line.unitQuantity}}x <span class="strike">{{ Line.Item.Prices.ItemPrice.amount|money }}</span>
				{% elseif Line.discountAmount == 0 and (Line.Item.Prices.ItemPrice.amount|money != divide(Line.displayableSubtotal, Line.unitQuantity)|money) %}
				{{Line.unitQuantity}}x {{ Line.displayableUnitPrice }}
				{% elseif dontShow == true %}
				<span class="visHide">{{Line.unitQuantity}}x</span>
				{% else %}
				{{Line.unitQuantity}}x {{ Line.Item.Prices.ItemPrice.amount|money }}
				{% endif %}
			{% endif %}
			{% if options.per_line_subtotal and options.discounted_line_items and Line.calcLineDiscount != 0 and not parameters.gift_receipt %}
			<span class="strike">{{Line.unitQuantity}}x {{Line.Item.Prices.ItemPrice.amount|money}}</span>
			{% endif %}
			{% if Line.unitQuantity > 1 %}
			{% else %}
				{% if (Line.displayableSubtotal == 0) and (Line.Item.Prices.ItemPrice.amount == 0) and (Line.unitQuantity != 0) %}	
						<span class="visHide" style="color:red;">{{Line.unitQuantity}}x</span>
				{% else %}
				{{Line.unitQuantity}}x
				{% endif %}
			{% endif %}
			{% if (options.per_line_subtotal or options.per_line_subtotal > 1) and not parameters.gift_receipt %} x
				{% if options.discounted_line_items %}
				{{ divide(Line.displayableSubtotal, Line.unitQuantity)|money }}
				{% else %}
				{{Line.displayableUnitPrice|money}}
				{% endif %}
			{% endif %}
		</td>

		<td data-automation="lineItemPrice" class="amount">
		{% if not parameters.gift_receipt %}
				{% if (Line.displayableSubtotal == 0) and (Line.Item.Prices.ItemPrice.amount == 0) and (Line.unitQuantity != 0) %}	
					<span class="visHide" style="color:red;">{{ Line.displayableSubtotal|money }}</span>
				{% if options.discounted_line_items and not options.per_line_subtotal and Line.calcLineDiscount != 0 %}
					{% if not isTaxInclusive or isTaxInclusive == 'false' %}
					<span class="strike">{{ Line.calcSubtotal|money }}</span><br />
					{% else %}
					<span class="strike">{{ multiply(Line.displayableUnitPrice, Line.unitQuantity)|money }}</span>
					<br />
					{% endif %}
				{% endif %}
			{% else %}
			{{ Line.displayableSubtotal|money }}
			{% endif %}	
		{% endif %}
		</td>
	</tr>
{% endmacro %}

{% macro receipt(Sale,parameters,store_copy,options) %}
	{% if Sale.SaleLines %}
		<table class="sale lines">
				<thead>
				<tr class="Sale-Title">
					<th class="Sale-Title">Items</th>

					{% if options.show_custom_sku and options.show_manufacturer_sku %}
						<th class="custom_field">Custom SKU</th>
						<th class="custom_field">Man. SKU </th>
					{% elseif options.show_custom_sku or options.show_manufacturer_sku %}
						<th class="custom_field">SKU</th>
					{% endif %}

					{% if options.show_msrp and not parameters.gift_receipt %}
						<th class="custom_field">MSRP</th>
					{% endif %}

					<th class="quantity Sale-Title">#</th>

					{% if not parameters.gift_receipt %}
						<th class="amount Sale-Title">Price</th>
					{% endif %}
				</tr>
			<thead>
			<tbody>
				{% for Line in Sale.SaleLines.SaleLine %}
					{{ _self.line(Sale.isTaxInclusive,Line,parameters,options) }}
				{% endfor %}
			</tbody>
		</table>
		
{# Item Count Loop based on sale line not item counts #}
				{% if Sale.SaleLines %}
					{% set transaction_line_count = 0 %}
					{% for Line in Sale.SaleLines.SaleLine %}
						{% set transaction_line_count = transaction_line_count + 1 %}
					{% endfor %}
				{% endif %}
				
		{% if not parameters.gift_receipt %}
			<table class="saletotals totals">
				<tbody id="receiptSaleTotals">
					<tr>
						<td width="100%">
							{% if not options.discounted_line_items and Sale.calcDiscount != 0 %}
								Subtotal w/ Discounts
							{% elseif Sale.calcDiscount == 0 and Sale.calcTaxable == 0  %}
							{% else %}								
							Subtotal
							{% endif %}
						</td>
						<td id="receiptSaleTotalsSubtotal" class="amount">
							{% if not options.discounted_line_items and Sale.calcDiscount != 0 %}
								{{subtract(Sale.displayableSubtotal, Sale.calcDiscount)|money}}
							{% elseif Sale.calcDiscount == 0 and Sale.calcTaxable == 0 %}
							{% else %}	
								{{Sale.displayableSubtotal|money}}
							{% endif %}
						</td>
					</tr>
					{% if Sale.calcDiscount > 0 %}
						<tr>
							<td>Discounts</td>
							<td id="receiptSaleTotalsDiscounts" class="amount">({{Sale.calcDiscount|money}})</td>
							</tr>
					{% elseif not options.discounted_line_items and Sale.calcDiscount < 0 %}
						<tr>
						<td>Discounts</td>
						<td id="receiptSaleTotalsDiscounts" class="amount">({{Sale.calcDiscount|getinverse|money}})</td>
						</tr>
					{% endif %}
					{% if Sale.taxTotal == 0 and transaction_line_count != 0 %}
										
						<tr style="display:none;"><td width="100%">Total Tax</td><td id="receiptSaleTotalsTax" class="amount" >{{Sale.taxTotal|money}}</td></tr>
					{% else %}
						{% for Tax in Sale.TaxClassTotals.Tax %}
							{% if Tax.taxname and Tax.rate > 0 %}
							<tr><td data-automation="receiptSaleTotalsTaxName" width="100%">{{Tax.taxname}} ({{Tax.subtotal|money}} @ {{Tax.rate}}%)</td><td data-automation="receiptSaleTotalsTaxValue" class="amount">{{Tax.amount|money}}</td></tr>
							{% endif %}
							{% if Tax.taxname2 and Tax.rate2 > 0 %}
							<tr><td data-automation="receiptSaleTotalsTaxName" width="100%">{{Tax.taxname2}} ({{Tax.subtotal2|money}} @ {{Tax.rate2}}%)</td><td data-automation="receiptSaleTotalsTaxValue" class="amount">{{Tax.amount2|money}}</td></tr>
							{% endif %}
						{% endfor %}
					{% endif %}
						<tr class="total"><td>Total</td><td id="receiptSaleTotalsTotal" class="amount">{{Sale.calcTotal|money}}</td></tr>
				</tbody>
			</table>
		{% endif %}
	{% endif %}

				
	{% if Sale.completed == 'true' and not parameters.gift_receipt %}
		{% if  transaction_line_count != 0 or Sale.SalePayments or Sale.displayableSubtotal != 0 %}
			<table id="receiptPayments" class="payments">
			                									<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">Payments</th></tr>
  </thead>
				<tbody>
					{% if not Sale.SalePayments and (Sale.calcSubtotal != 0 or transaction_line_count > 0) %}
					<tr>
						<td class="label">Total</td>
						<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|money}}</td>
					</tr>
					{% else %}
					{% for Payment in Sale.SalePayments.SalePayment %}
						{% if Payment.PaymentType.name != 'Cash' %}
							<!-- NOT Cash Payment -->
							{% if Payment.CreditAccount.giftCard == 'true' %}
								<!--  Gift Card -->
								{% if Payment.amount > 0 %}
									<tr>
										<td class="label">Gift Card Charge</td>
										<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|money}}</td>
									</tr>
									{% set giftCardNumUsed = ''%}
							{% if Payment.CreditAccount.giftCard == 'true' %}
									{% if Payment.CreditAccount.code != '' %}
									{% set giftCardNumUsed = Payment.CreditAccount.code %}
									{% else %}
									{% set giftCardNumUsed = Payment.CreditAccount.description| split(' ')|last|replace({')': "", '(': ""}) %}
									{% endif %}
									<tr class="gift-card-used">
										<td>Gift Card #:</td>
										<td> {{giftCardNumUsed}}</td>										
									</tr>
							{% endif %}
									<tr>
										<td class="label">Balance</td>
										<td id="receiptPaymentsGiftCardBalance" class="amount">{{Payment.CreditAccount.balance|getinverse|money}}</td>
									</tr>
								{% elseif Payment.amount < 0 and Sale.calcTotal < 0 %}
									<tr>
										<td class="label">Refund To Gift Card</td>
										<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|getinverse|money}}</td>
									</tr>
									<tr>
										<td class="label">Balance</td>
										<td id="receiptPaymentsGiftCardBalance" class="amount">{{Payment.CreditAccount.balance|getinverse|money}}
									</tr>
								{% elseif Payment.amount < 0 and Sale.calcTotal >= 0 %}
									<tr>
										<td class="label">Gift Card Purchase</td>
										<td id="receiptPaymentsGiftCardValue" class="amount">{{Payment.amount|getinverse|money}}</td>
									</tr>
									<tr>
										<td class="label">Balance</td>
										<td id="receiptPaymentsGiftCardBalance" class="amount">{{Payment.CreditAccount.balance|getinverse|money}}</td>
									</tr>
								{% endif %}
							{% elseif Payment.creditAccountID == 0 %}
								<!--  NOT Customer Account -->
								{{ _self.cc_payment_info(Sale,Payment) }}
							{% elseif Payment.CreditAccount and Payment.archived == 'false' %}
								<!-- Customer Account -->
								<tr>
									{% if Payment.amount < 0 %}
									<td class="label">Account Deposit</td>
									<td id="receiptPaymentsCreditAccountDepositValue" class="amount">{{Payment.amount|getinverse|money}}</td>
									{% else %}
									<td class="label">Account Charge</td>
									<td id="receiptPaymentsCreditAccountChargeValue" class="amount">{{Payment.amount|money}}</td>
									{% endif %}
								</tr>
							{% endif %}
						{% endif %}
					{% endfor %}
					{% endif %}
					<tr><td colspan="2"></td></tr>
					{{ _self.sale_cash_payment(Sale) }}
				</tbody>
			</table>
		{% endif %}
		{% if (Sale.SalePayments or Sale.calcSubtotal > 0 or transaction_line_count > 0) and Sale.Customer.MetaData.subtotal > 0 %} 
			<div class="footer_if_open_orders page-break_after">

				<div>{{ _self.no_tax_applied_star(Sale) }}</div>

				{% if transaction_line_count != 0 %}
				<div>{{ _self.from_open_order(Sale) }}</div>
				{% endif %}
				<p id="receiptNote" class="note">
					{{ Sale.Shop.ReceiptSetup.generalMsg|noteformat|raw }} 
				</p>
				<p id="receiptThankYouNote" class="thankyou">Thank You{% if Sale.Customer %} {{Sale.Customer.firstName}} {{Sale.Customer.lastName}}{% endif %}!
				</p>
				<p class="barcodeContainer">
					<img id="barcodeImage" height="50" width="250" class="barcode" src="/barcode.php?type=receipt&amp;number={{Sale.ticketNumber}}&amp;hide_text={{ not show_barcode_sku }}"> 	</p>
			</div>
		{% else %}
		{% endif %}
		{% if Sale.Customer and not store_copy %}
				{% if Sale.Customer.MetaData.subtotal > 0 %}
						{% if Sale.calcSubtotal != 0 and Sale.Customer.MetaData.subtotal > 0 %}
						<div class="OpenOrders">
							<div class="openOrders-Header" style="text-align: center !important;"><img src="{{Sale.Shop.ReceiptSetup.logo}}" width="{{ options.logo_width }}" height="{{ options.logo_height }}" class="logo"></div>
							<div class="openOrders-names">
                         		<div class="openOrders-LN" style="padding-top:25px;text-align:center;">{% if Sale.Customer.company|strlen > 2 %}{{Sale.Customer.company}}{% else %}{{Sale.Customer.lastName}}{% endif %}</div>
                         		{{ _self.dateOpenOrder(Sale) }}
								<div id="receiptCustomerName" style="text-align:center;">{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}</div>
							</div>
							<div class="openOrders">Open Orders</div>
						</div>
						{% else %}	
						<div class="OpenOrders">
							<div class="openOrders-Header" style="text-align: center !important;"><img src="{{Sale.Shop.ReceiptSetup.logo}}" width="{{ options.logo_width }}" height="{{ options.logo_height }}" class="logo"></div>
							<div class="openOrders-names">
                         		<div class="openOrders-LN" style="padding-top:25px;text-align:center;">{% if Sale.Customer.company|strlen > 2 %}{{Sale.Customer.company}}{% else %}{{Sale.Customer.lastName}}{% endif %}</div>
                         		{{ _self.dateOpenOrder(Sale) }}
								<div id="receiptCustomerName" style="text-align:center;">{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}</div>
							</div>
							<div class="openOrders">Open Orders</div>
							</div>
						{% endif %}
				{% endif %}
			{% if options.show_customer_specialorders %}
				{{ _self.specialorders(Sale.Customer,Sale.isTaxInclusive,parameters.gift_receipt,options)}}
			{% endif %}	
			{% if options.show_customer_layaways %}
				{{ _self.layaways(Sale.Customer,Sale.isTaxInclusive,parameters.gift_receipt,options)}}
			{% endif %}
			{% if options.show_customer_workorders %}
				{{ _self.workorders(Sale.Customer,parameters.gift_receipt,options)}}
			{% endif %}
		{% endif %}
		{# open order counter - added KA 2-8-2021 #}
	{% set openOrderCount = 0 %}
	{% set soCount = 0 %}{% set layCount = 0 %}{% set woCount = 0 %}
	{% if Sale.Customer.SpecialOrders %} {% set soCount = 1 %}{% endif %}
	{% if Sale.Customer.WorkOrders %} {% set layCount = 1 %}{% endif %}
	{% if Sale.Customer.Layaways %} {% set woCount = 1 %}{% endif %}
	{% set openOrderCount = (soCount + layCount +  woCount) %}
		
		{% if options.show_customer_credit_account and Sale.Customer and not parameters.gift_receipt and not store_copy %}
			<table class="totals">
			{% if Sale.Customer.CreditAccount or Sale.Customer.CreditAccount.MetaData.creditBalanceOwed > 0 or Sale.Customer.CreditAccount.MetaData.extraDeposit > 0 or openOrderCount > 1 %}
						
					{% if Sale.Customer.CreditAccount.MetaData.creditBalanceOwed > 0 %}	
					<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">Store Account Balance</th></tr>
  </thead>			<tbody>
								<tr>
									<td width="100%">Balance Owed: </td>
									<td class="amount">{{ Sale.Customer.CreditAccount.MetaData.creditBalanceOwed|money }}</td>
								</tr>
		
					{% elseif openOrderCount > 1 %}
					 <!-- testing --><thead style="display: table-header-group; border-bottom:2px solid black;">
     <tr><th class="footerSectionTitleH2" colspan="2">Open Order Summary</th></tr>
  </thead><tbody>
							{% if Sale.Customer.MetaData.subtotal  > 0 %}				
							<tr class="total">
								<td width="100%">Subtotal </td>
								<td class="amount">{{ Sale.Customer.MetaData.subtotal|money }}</td>
							</tr>		
							{% endif %}				
							{% if Sale.Customer.MetaData.allDiscounts > 0 %}								
<tr>							
{% set discountPCT %}
{{ (divide(Sale.Customer.MetaData.allDiscounts,Sale.Customer.MetaData.subtotal)*100)|number_format(1)}}
{% endset %}								
<td width="100%">Discounts ({{discountPCT}}%)</td>
								<td class="amount">({{ Sale.Customer.MetaData.allDiscounts|money }})</td>
							</tr>							
							{% endif %}
							{% if Sale.Customer.MetaData.taxTotal > 0 %}	
<tr>							
								<td width="100%">Tax Total </td>
								<td class="amount">{{Sale.Customer.MetaData.taxTotal|money}}</td>
							</tr>
					               {% endif %}
{% if Sale.Customer.CreditAccount.MetaData.extraDeposit > 0 or Sale.Customer.MetaData.getAmountToCompleteAll > 0 %}
<tr>							
								<td width="100%">Grand Total </td>
								<td class="amount">{{ Sale.Customer.MetaData.total|money }}</td>
							</tr>	
							{% endif %}
{% if Sale.Customer.CreditAccount.MetaData.extraDeposit != 0 %}
<tr>							
								<td width="100%">On Deposit </td>
								<td class="amount">({{Sale.Customer.CreditAccount.MetaData.extraDeposit|money}})</td>
							</tr>
					{% endif %}
					{% endif %}
				</tbody></table>
			{% endif %}
{% set OpenOrder_withBlanceTotalDue = 0 %}
{% set OpenOrder_withBlanceDue = false %}
{% if Sale.Customer.MetaData.getAmountToCompleteAll > 0 and Sale.Customer.CreditAccount.MetaData.creditBalanceOwed > 0 %}
{% set OpenOrder_withBlanceDue = true %}
{% set OpenOrder_withBlanceTotalDue = (Sale.Customer.MetaData.getAmountToCompleteAll + Sale.Customer.CreditAccount.MetaData.creditBalanceOwed)|money %}
{% endif %}

		{% if Sale.Customer.CreditAccount.MetaData.extraDeposit > 0 or Sale.Customer.MetaData.getAmountToCompleteAll > 0 or Sale.Customer.MetaData.getAmountToCompleteAll > 0 %}
							<table class="totals">
				{% if Sale.Customer.CreditAccount.MetaData.extraDeposit != 0 and openOrderCount == 1 %}
					<tr>							
						<td width="100%">On Deposit </td>
						<td class="amount">({{Sale.Customer.CreditAccount.MetaData.extraDeposit|money}})</td>
					</tr>
				{% endif %}
{%  if Sale.Customer.CreditAccount.MetaData.extraDeposit > 0  and Sale.Customer.MetaData.getAmountToCompleteAll > 0 %}

					<tr class="total total-remain this-1">
						<td width="100%">Remaining Balance: </td>
						<td class="amount">{{ Sale.Customer.MetaData.getAmountToCompleteAll|money }}</td>
					</tr>
			{%  elseif Sale.Customer.CreditAccount.MetaData.extraDeposit > 0  and Sale.Customer.MetaData.getAmountToCompleteAll|money == 0 %}
					<tr class="total total-remain0 this-2">
						<td width="100%">Remaining Balance: </td>
						<td class="amount">{{ Sale.Customer.MetaData.getAmountToCompleteAll|money }}</td>
					</tr>
{% elseif OpenOrder_withBlanceDue == true %}
					<tr class="total total-remain this-3">
						<td width="100%">Remaining Balance: </td>
						<td class="amount">{{OpenOrder_withBlanceTotalDue}}</td>
					</tr>
{% else %}
					<tr class="total total-remain this-4">
						<td width="100%">Remaining Balance: </td>
						<td class="amount">{{ Sale.Customer.MetaData.getAmountToCompleteAll|money }}</td>
					</tr>
			{% endif %}
				</table>
		{% endif %}
		{% endif %}
	{% endif %}
	{% if (not parameters.gift_receipt and not options.hide_notes_in_sale_receipt) or (parameters.gift_receipt and not options.hide_notes_in_gift_receipt) %}
		{{ _self.show_note(Sale.SaleNotes) }}
	{% endif %}
{% endmacro %}
{% macro cc_payment_info(Sale,Payment) %}
	<tr>
		{% if Payment.archived == 'false' %}
			{% if Payment.ccChargeID > 0 and Payment.CCCharge.declined == 'false' %}
				<td class="label" width="100%">
					{{ Payment.PaymentType.name }} 
					{% if Payment.PaymentType.name %} ending in *{{Payment.CCCharge.xnum| upper}}
					{% elseif Payment.CCCharge.cardType|strlen > 0 %} ending in *{{Payment.CCCharge.cardType| upper}}
					{% else %}					
					{% endif %}
					{#{% if Payment.CCCharge.cardholderName|strlen > 0 %}
						<br>Cardholder: {{Payment.CCCharge.cardholderName}}
					{% endif %}
					{% if Payment.CCCharge.entryMethod|strlen > 0 %}
						<br>Entry: {{Payment.CCCharge.entryMethod}}
					{% endif %}
					{% if Payment.CCCharge.authCode|strlen > 0 %}
						<br>Approval: {{Payment.CCCharge.authCode}}
					{% endif %}
					{% if Payment.CCCharge.gatewayTransID|strlen > 0 and Payment.CCCharge.gatewayTransID|strlen < 48 %}
						<br>ID: {{Payment.CCCharge.gatewayTransID}}
					{% endif %}
					{% if Payment.CCCharge.MetaData.isEMV %}
						{% if Payment.CCCharge.MetaData.AID|strlen > 0 %}
							<br>AID: {{Payment.CCCharge.MetaData.AID}}
						{% endif %}
						{% if Payment.CCCharge.MetaData.ApplicationLabel|strlen > 0 %}
							<br>Application Label: {{Payment.CCCharge.MetaData.ApplicationLabel}}
						{% endif %}
						{% if Payment.CCCharge.MetaData.PINStatement|strlen > 0 %}
							<br>PIN Statement: {{Payment.CCCharge.MetaData.PINStatement}}
						{% endif %}
					{% endif %}
				</td>#}
				<td class="amount">{{Payment.amount|money}}</td>
			{% elseif Payment.ccChargeID == 0 %}
				<td class="label" width="100%">
					{{ Payment.PaymentType.name }}
				</td>
				<td class="amount">{{Payment.amount|money}}</td>
			{% endif %}
		{% endif %}
	</tr>
{% endmacro %}

{% macro transaction(Payment) %}
    {% if Payment.PaymentType.type == 'credit card' and Payment.MetaData.ReceiptData.status != 'error' and Payment.archived == 'false' %}
        {% if Payment.MetaData.ReceiptData.type|strlen and Payment.MetaData.ReceiptData.authorized_amount|strlen %}
            <tr>
                <td class="label top">{{ mostranslate(Payment.MetaData.ReceiptData.type, 'capitalize', true) }}</td>
                <td class="top">{{ Payment.MetaData.ReceiptData.authorized_amount|money }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.extra_parameters.statusCode|strlen %}
            <tr>
                <td class="label">Status:</td>
                <td>{{ Payment.MetaData.ReceiptData.extra_parameters.statusCode }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.card_brand|strlen and Payment.MetaData.ReceiptData.card_number|strlen %}
            <tr>
                <td class="label">{{ Payment.MetaData.ReceiptData.card_brand }}</td>
                <td>{{ getDisplayableCardNumber(Payment.MetaData.ReceiptData.card_number) }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.processed_date|strlen %}
            <tr>
                <td class="label">Date:</td>
                <td>
                    {{ Payment.MetaData.ReceiptData.processed_date|correcttimezone|date(getDateTimeFormat()) }}
                </td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.entry_method|strlen %}
            <tr>
                <td class="label">Method:</td>
                <td>{{ Payment.MetaData.ReceiptData.entry_method }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.extra_parameters.acceptorId|strlen %}
            <tr>
                <td class="label">MLC:</td>
                <td>{{ Payment.MetaData.ReceiptData.extra_parameters.acceptorId }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.authorization_number|strlen %}
            <tr>
                <td class="label">Auth Code:</td>
                <td>{{ Payment.MetaData.ReceiptData.authorization_number }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkCode|strlen or Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkMessage|strlen %}
            <tr>
                <td class="label">Response:</td>
                <td>{{ Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkCode }}/{{ Payment.MetaData.ReceiptData.extra_parameters.authorizationNetworkMessage }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.emv_application_id|strlen %}
            <tr>
                <td class="label">AID:</td>
                <td>{{ Payment.MetaData.ReceiptData.emv_application_id }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.emv_application_preferred_name|strlen %}
            <tr>
                <td class="label">APN:</td>
                <td>{{ Payment.MetaData.ReceiptData.emv_application_preferred_name }}</td>
            </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.extra_parameters.accountType|strlen %}
        <tr>
            <td class="label">Account Type:</td>
            <td>{{ Payment.MetaData.ReceiptData.extra_parameters.accountType }}</td>
        </tr>
        {% endif %}

        {% if Payment.MetaData.ReceiptData.emv_cryptogram_type|strlen or Payment.MetaData.ReceiptData.emv_cryptogram|strlen %}
            <tr>
                <td class="label">Cryptogram:</td>
                <td>{{ Payment.MetaData.ReceiptData.emv_cryptogram_type }} {{ Payment.MetaData.ReceiptData.emv_cryptogram }}</td>
            </tr>
        {% endif %}

        {% for emvTag in Payment.MetaData.ReceiptData.extra_parameters.emv_tags.children() %}
            <tr>
                <td class="label">{{ emvTag.getName() }}</td>
                <td>{{ emvTag }}</td>
            </tr>
        {% endfor %}

        {# Creates a Line Break for the next Payment #}
        <tr><td colspan="2"><br /></td></tr>
    {% endif %}
{% endmacro %}

{% macro single_transaction_details(Sale, Payment) %}
    {% if hasCCPayment(Sale.SalePayments) %}
        {% if isUnifiedReceipt(Sale.SalePayments) %}
            <h2 class="paymentTitle">Transaction Details</h2><br />
            <div id="receiptTransactionDetails">
                <table>
                    <tbody>
                        {{ _self.transaction(Payment) }}
                    </tbody>
                </table>
            </div>
        {% endif %}
    {% endif %}
{% endmacro %}

{% macro transaction_details(Sale) %}
    {% if hasCCPayment(Sale.SalePayments) %}
        {% if isUnifiedReceipt(Sale.SalePayments) %}
            <h2 class="paymentTitle">Transaction Details</h2><br />
            <div id="receiptTransactionDetails">
                <table>
                    <tbody>
                        {% for Payment in Sale.SalePayments.SalePayment %}
                            {{ _self.transaction(Payment) }}
                        {% endfor %}
                    </tbody>
                </table>
            </div>
        {% endif %}
    {% endif %}
{% endmacro %}

{% macro cc_agreement(Sale,Payment,options) %}
	{% if Payment.MetaData.ReceiptData.requires_receipt_signature|CompBool == true %}
		{% if Sale.Shop.ReceiptSetup.creditcardAgree|strlen > 0 %}
			<p>{{Sale.Shop.ReceiptSetup.creditcardAgree|noteformat|raw}}</p>
		{% endif %}
		<dl id="signatureSection" class="signature">
			<dt>Signature:</dt>
			<dd>
				{{Payment.CCCharge.cardholderName}}<br />
			</dd>
		</dl>
	{% endif %}
{% endmacro %}

{% macro shop_workorder_agreement(Sale) %}
	{% if Sale.Shop.ReceiptSetup.workorderAgree|strlen > 0 and Sale.Workorders %}
	<!--
		@FIXME
		Should only print this work_order agreement if it's never been signed before.
		transaction->customer_id->printWorkorderAgreement($transaction->transaction_id)  -->
		<div class="signature">
			<p>{{Sale.Shop.ReceiptSetup.workorderAgree|noteformat|raw}}</p>
			<dl class="signature">
				<dt>Signature:</dt>
				<dd>{{Sale.Customer.firstName}} {{Sale.Customer.lastName}}</dd>
			</dl>
		</div>
	{% endif %}
{% endmacro %}

{% macro client_workorder_agreement(Sale,options) %}
	{% if options.workorders_as_title and Sale.SaleLines is empty and Sale.Customer.Workorders is defined and Sale.Shop.ReceiptSetup.workorderAgree|strlen > 0 %}
		<p>{{Sale.Shop.ReceiptSetup.workorderAgree|noteformat|raw}}</p>
	{% endif %}
{% endmacro %}

{% macro ship_to(Sale,options) %}
	{% if Sale.ShipTo %}
		<div class="shipping">
			<h4>Ship To</h4>
			{{ _self.shipping_address(Sale.ShipTo,Sale.ShipTo.Contact,options) }}

			{% for Phone in Sale.ShipTo.Contact.Phones.ContactPhone %}{% if loop.first %}
				<p>Phone: {{Phone.number}} ({{Phone.useType}})</p>
			{% endif %}{% endfor %}

			{% if Sale.ShipTo.shipNote|strlen > 0 %}
				<h5>Instructions</h5>
				<p>{{Sale.ShipTo.shipNote}}</p>
			{% endif %}
		</div>
	{% endif %}
{% endmacro %}

{% macro shipping_address(Customer,Contact,options) %}
	<p>
		{% if Customer.company|strlen > 2 %}{{Customer.company}}<br>{% endif %}
		{% if Customer.company|strlen > 2 %}Attn:{% endif %} {{Customer.firstName}} {{Customer.lastName}}<br>
		{{ _self.address(Contact,'<br>',options) }}
	</p>
{% endmacro %}

{% macro address(Contact,delimiter,options) %}
	{% autoescape false %}
		{% set Address = Contact.Addresses.ContactAddress %}

		{% if Address.address1|strlen > 0 %}{{Address.address1}}{{delimiter}}{% endif %}
		{% if Address.address2|strlen > 1 %}{{Address.address2}}{{delimiter}}{% endif %}
		{% if Address.city|strlen > 0 %}{{Address.city}}{% if Address.state|strlen > 0 or Address.zip|strlen > 0%},{% endif %}{% endif %}
		{% if Address.state|strlen > 0 %}{{Address.state}}{% if Address.zip|strlen > 0 %},{% endif %}{% endif %}
		{% if Address.zip|strlen > 0 %}{{Address.zip}}{% endif %}{% if Address.zip|strlen > 0 or Address.city|strlen > 0 or Address.state|strlen > 0 %}{{delimiter}}{% endif %}
		{% if Address.country|strlen > 0 and (not 'United States' in Address.country) %}{{Address.country}}{% endif %}

	{% endautoescape %}
{% endmacro %}

{% macro header(Sale,options) %}
	<div class="receiptHeader">
		{% set logo_printed = false %}
		{% if options.multi_shop_logos %}
			{% for shop in options.shop_logo_array if not logo_printed %}
				{% if shop.name == Sale.Shop.name %}
					{% if shop.logo_url|strlen > 0 %}
						<img src="{{ shop.logo_url }}" width ={{ options.logo_width }} height="{{ options.logo_height }}" class="logo">
						{% set logo_printed = true %}
					{% endif %}
				{% endif %}
			{% endfor %}
		{% endif %}

		{% if Sale.Shop.ReceiptSetup.logo|strlen > 0 and not logo_printed %}
			<img src="{{Sale.Shop.ReceiptSetup.logo}}" width="{{ options.logo_width }}" height="{{ options.logo_height }}" class="logo">
			{% if show_shop_name_with_logo %}
				<h3 class="receiptShopName">{{ Sale.Shop.name }}</h3>
			{% endif %}
		{% else %}
			<h3 class="receiptShopName">{{ Sale.Shop.name }}</h3>
		{% endif %}
		<p class="receiptShopContact">
			{% if Sale.Shop.ReceiptSetup.header|strlen > 0 %}
				<p>{{Sale.Shop.ReceiptSetup.header|nl2br|raw}}</p>
			{% else %}
				{{ _self.address(Sale.Shop.Contact,'<br>',options) }}
				{% for ContactPhone in Sale.Shop.Contact.Phones.ContactPhone %}
					<br />{{ContactPhone.number}}
				{% endfor %}
			{% endif %}
		</p>
	</div>
{% endmacro %}


{% macro specialorders(Customer,isTaxInclusive,parameters,options) %}
	{% if Customer.SpecialOrders|length > 0 %}
		<table id="containerSOLineItems" class="lines specialorders">
		<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">Special Orders</th></tr>
  </thead>
			<tbody>
				{% for Line in Customer.SpecialOrders.SaleLine %}
					{{ _self.line(isTaxInclusive,Line,parameters,options) }}
				{% endfor %}
			</tbody>
		</table>
		<table id="containerSOTotals" class="specialorders totals">
			<tr>
				<td class="label" width="100%">Subtotal</td>
				<td class="amount">{{Customer.MetaData.specialOrdersSubtotal|money}}</td>
			</tr>
			{% if Customer.MetaData.specialOrdersAllDiscounts > 0 %}
				<tr>
					<td class="label" width="100%">Discounts</td>
					<td class="amount">({{Customer.MetaData.specialOrdersAllDiscounts|getinverse|money}})</td>
				</tr>
			{% endif %}
                        {% if Customer.MetaData.specialOrdersTaxTotal > 0 %}
			<tr>
				<td class="label" width="100%">Total Tax</td>
				<td class="amount">{{Customer.MetaData.specialOrdersTaxTotal|money}}</td>
			</tr>
			{% endif %}
			<tr class="total">
				<td class="label" width="100%">Total</td>
				<td class="amount">{{Customer.MetaData.specialOrdersTotal|money}}</td>
			</tr>
		</table>
	{% endif %}
{% endmacro %}
{% macro layaways(Customer,isTaxInclusive,parameters,options) %}
	{% if Customer.Layaways and Customer.Layaways|length > 0 %}
		<table class="lines layaways">
				<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">{{ mostranslate('Item(s) set aside', 'capitalize', true) }}</th></tr>
  </thead>
			<tbody>
			{% for Line in Customer.Layaways.SaleLine %}
				{{ _self.line(isTaxInclusive,Line,parameters,options)}}
			{% endfor %}
			</tbody>
		</table>
		<table class="layways totals">
			<tr>
				<td class="label" width="100%">Subtotal</td>
				<td class="amount">{{Customer.MetaData.layawaysSubtotal|money}}</td>
			</tr>
			{% if Customer.MetaData.layawaysAllDiscounts > 0 %}
				<tr>
					<td class="label" width="100%">Discounts</td>
					<td class="amount">({{Customer.MetaData.layawaysAllDiscounts|getinverse|money}})</td>
				</tr>
			{% endif %}
			{% if Customer.MetaData.layawaysTaxTotal > 0 %}
			<tr>
				<td class="label" width="100%">Total Tax</td>
				<td class="amount">{{Customer.MetaData.layawaysTaxTotal|money}}</td>
			</tr>
		{% endif %}
			<tr class="total">
				<td class="label" width="100%">Total</td>
				<td class="amount">{{Customer.MetaData.layawaysTotal|money}}</td>
			</tr>
		</table>
	{% endif %}
{% endmacro %}
{% macro workorders(Customer,parameters,options) %}
	{% if Customer.Workorders|length > 0 %}
	{#	<h2 class="footerSectionTitle">Open Workorders</h2> #}
		<table class="lines workorders">
						<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">Open Workorders</th></tr>
  </thead><tbody>
			{% for Line in Customer.Workorders.SaleLine %}
				<tr>
					{% if Line.MetaData.workorderTotal %}
						<td class="workorder" colspan="2">
							{{ _self.lineDescription(Line,options) }}
							{% if options.show_workorders_barcode %}
								<p class="barcodeContainer">
									<img id="barcodeImage"
											 height="50"
											 width="250"
											 class="barcode"
											 src="/barcode.php?type=receipt&number={{ Line.MetaData.workorderSystemSku }}&&hide_text={{ not options.show_workorders_barcode_sku }}">
								</p>
							{% endif %}
						</td>
					{% else %}
						<td>{{ _self.lineDescription(Line,options) }}</td>
						<td class="amount">{{Line.calcSubtotal|money}}</td>
					{% endif %}
				</tr>
			{% endfor %}</tbody>
		</table>
		{% if Customer.Workorders.SaleLine.isWorkorder == 'true' %}
			<table class="workorders totals">
				<tr>
					<td class="label" width="100%">Subtotal</td>
					<td class="amount">{{Customer.MetaData.workordersSubtotalNoDiscount|money}}</td>
				</tr>
				{% if Customer.MetaData.specialOrdersAllDiscounts > 0 %}
					<tr>
						<td class="label" width="100%">Discounts</td>
						<td class="amount">({{Customer.MetaData.workordersAllDiscounts|getinverse|money}})</td>
					</tr>
				{% endif %}
				{% if Customer.MetaData.workordersTaxTotal > 0 %}
				<tr>
					<td class="label" width="100%">Total Tax</td>
					<td class="amount">{{Customer.MetaData.workordersTaxTotal|money}}</td>
				</tr>
				{% endif %}
				<tr class="total">
					<td class="label" width="100%">Total</td>
					<td class="amount">{{Customer.MetaData.workordersTotal|money}}</td>
				</tr>
			</table>
		{% endif %}
	{% endif %}
{% endmacro %}

{% macro sale_cash_payment(Sale) %}
	{% set total = Sale.change|floatval %}
	{% set pay_cash = 'false' %}
	{% for Payment in Sale.SalePayments.SalePayment %}
		{% if Payment.PaymentType.name == 'Cash' and Payment.archived == 'false' %}
			{% set total = total + Payment.amount|floatval %}
			{% set pay_cash = 'true' %}
		{% endif %}
	{% endfor %}
	{% if pay_cash == 'true' %}
		<tr><td class="label">Cash</td><td id="receiptPaymentsCash" class="amount">{{total|money}}</td></tr>
		<tr><td class="label">Change</td><td id="receiptPaymentsChange" class="amount">{{Sale.change|money}}</td></tr>
	{% endif %}
{% endmacro %}

{% macro show_note(SaleNotes) %}
	{% for SaleNote in SaleNotes %}
		{% if SaleNote.PrintedNote and SaleNote.PrintedNote.note != '' %}
			<table>
									<thead>
     <tr><th class="footerSectionTitleH2" colspan="2">NOTES</th></tr>
  </thead><tbody>
				<tr>
					<td class="notesNote">
						{{SaleNote.PrintedNote.note}}
					</td>
				</tr></tbody>
			</table>
		{% endif %}
	{% endfor %}
{% endmacro %}
