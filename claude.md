# CV Comparison: __petrovCV__short.tex vs __petrovCV__.tex

## Overview
- **Short CV**: 366 lines, Brief version
- **Long CV**: 1332 lines, Full comprehensive version
- Both use same document class and similar formatting setup

## Document Structure Comparison

### Headers and Personal Info
**Short CV**:
- Title: "Leonid Petrov . Brief CV" (centered, huge bold)
- Links to full version
- Basic contact: department, email, homepage, ORCID

**Long CV**:
- Title: "Leonid Petrov. Curriculum Vitae" (left-aligned, huge)
- Links to brief version
- Full contact: address, office phone, two emails, homepage, ORCID in table format

### Common Sections (both CVs)
1. **Research areas** - Identical content
2. **Education** - Same content but long CV has more details (advisor, thesis title)
3. **Appointments** - Identical main positions
4. **Visiting Appointments** - Identical
5. **Recent prizes/funding** - Identical but short CV says "Recent" in title
6. **Teaching** - Both have teaching sections but formatted differently

### Sections ONLY in Short CV
1. **Publications** - Uses `TEX_CV_publist_short.tex` input file
2. Brief organization section integrated into "Recent organization and service"

### Sections ONLY in Long CV
1. **Publications** - Uses full `TEX_CV_publist.tex` input file
2. **Talks and conferences** - Major section with:
   - Seminar talks (extensive table from 2025-2008)
   - Conference talks (extensive list from 2025-2008)
3. **Editing and reviewing** - Detailed editorial boards, reviewing activities
4. **Other** - AI initiatives, art exhibitions, course notes
5. **Personal** - Date of birth, languages, citizenship, family, phone

### Organization/Service Section Differences

**Short CV** - Combined "Recent organization and service":
- Recent events only (2020-2025)
- Includes other service items at end (editorial boards, reviewing, AI guide)

**Long CV** - Separate "Organization and service":
- Complete list from 2014-current
- More detailed entries
- Includes reading seminars, website development
- Editing/reviewing in separate section

### Teaching Section Differences

**Short CV**:
- Summarized by institution
- Lists course names only
- No dates or details

**Long CV**:
- Chronological by semester (Spring 2025 back to 2007)
- Course numbers and sections
- Links to course webpages
- Special notes (online, honors sections, etc.)

### Key Formatting Differences
1. **Students/postdocs**: Identical content in both
2. **Publications section**: Short CV likely has selected publications, long CV has complete list
3. **Page length**: Short CV designed to be 2 pages, long CV is comprehensive

## Event Organization Format Analysis

Looking at the organization sections, events follow this general pattern:

```latex
\item [YEAR:]
EVENT_NAME
ADDITIONAL_DETAILS
```

Or with links:
```latex
\item [YEAR:]
\href{URL}{EVENT_NAME},
DATE, LOCATION.
```

Recent examples from the CVs:
- Conferences/workshops with full names
- Dates (full dates or just month/year)
- Locations (city, state/country)
- URLs when available
- Special notes (postponed, canceled, virtual)

## Guidelines for CV Maintenance

### Adding New Events
Events should be added to:
- **Long CV**: "Organization and service" section - comprehensive list
- **Short CV**: "Recent organization and service" section - recent/major events only

### Event Format Template
```latex
\item [YEAR:]
EVENT_NAME,
INSTITUTION,
LOCATION,
DATES.
```

With URL:
```latex
\item [YEAR:]
\href{URL}{EVENT_NAME},
DATES, LOCATION.
```

### Adding Publications
- **Long CV**: Add to `TEX_CV_publist.tex`
- **Short CV**: Add to `TEX_CV_publist_short.tex` (selected publications only)

### Adding Talks
- **Seminar talks**: Add to the longtable in chronological order
- **Conference talks**: Add to etaremune list (reverse chronological)
- Include: date, venue, type (invited/contributed/special session)

### Updating Other Sections
- **Appointments**: Keep dates in [YYYY--YYYY:] format
- **Grants/Funding**: Include grant number, title, amount
- **Teaching**: Long CV uses semester-by-semester format, short CV summarizes by institution
- **Students/Postdocs**: Include name, role, years, current position

### Style Conventions
- Use \item for list entries
- Years in square brackets: [2024:]
- Italicize special notes with \emph{}
- Keep consistent punctuation (periods at end of entries)
- Use \\ for line breaks within entries
- Maintain alphabetical/chronological order as established